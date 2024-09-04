import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:pyramakerz_atendnace/core/error/failure.dart';
import 'package:pyramakerz_atendnace/core/services/cache_service.dart';
import 'package:pyramakerz_atendnace/core/services/location_service.dart';
import 'package:pyramakerz_atendnace/features/auth/data/models/get_profile/user_reponse.dart';
import 'package:pyramakerz_atendnace/features/dashboard/data/models/clock_history/clock_history.dart';
import 'package:pyramakerz_atendnace/features/dashboard/data/models/clock_models/clock_request.dart';
import 'package:pyramakerz_atendnace/features/dashboard/data/models/clock_models/clock_response.dart';
import 'package:pyramakerz_atendnace/features/home/data/repository/home_repository.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _repository;
  final LocationService _locationService;
  final CacheService _cacheService;
  StreamSubscription<InternetStatus>? _internetStatusSubscription;

  HomeCubit(
      {required HomeRepository repository,
      required LocationService locationService,
      required CacheService cacheService})
      : _repository = repository,
        _locationService = locationService,
        _cacheService = cacheService,
        super(const HomeState(status: HomeStateStatus.initial));

  Future<void> init({required User user}) async {
    emit(
      state.copyWith(
        user: user,
        checkInStatus: user.isClockedOut == true
            ? CheckInStateStatus.checkedIn
            : CheckInStateStatus.checkedOut,
      ),
    );
    await askForPermission();
    _listenToInternetConnectivity();
  }

  Future<void> askForPermission() async {
    final isGranted = await _locationService.askForPermissionIfNeeded();
    if (isGranted) {
      emit(state.copyWith(
        isLocationPermissionGranted: true,
      ));
      await _getCurrentLocation();
    } else {
      emit(state.copyWith(
          isLocationPermissionGranted: false,
          message: 'Permission not granted!'));
    }
  }

  Future<bool> _getCurrentLocation() async {
    try {
      final position = await _locationService.getCurrentLocation();
      emit(state.copyWith(currentLocation: position));
      return true;
    } catch (e) {
      emit(
          state.copyWith(status: HomeStateStatus.error, message: e.toString()));
      return false;
    }
  }

  Future<void> refresh() => getMyClocks();
  Future<void> getMyClocks() async {
    emit(
        state.copyWith(myClocksStateStatus: MyClocksStateStatus.gettingClocks));
    try {
      emit(state.copyWith(currentPage: 1));
      final myClocksResponse = await _repository.getMyClocks(page: 1);

      final clocks = myClocksResponse.clocks;

      emit(state.copyWith(
          myClocks: clocks ?? [],
          totalPages: myClocksResponse.pagination?.lastPage ?? 1,
          myClocksStateStatus: MyClocksStateStatus.gotClocks));
    } on Failure catch (e) {
      emit(state.copyWith(
          myClocks: [],
          totalPages: 1,
          myClocksStateStatus: MyClocksStateStatus.gettingClocksError,
          message: e.message));
    } catch (e) {
      emit(state.copyWith(
          myClocks: [],
          myClocksStateStatus: MyClocksStateStatus.gettingClocksError,
          message: 'An Error Occurred'));
    }
  }

  Future<void> getMoreClocks() async {
    if (state.isGettingMoreClocks) return;
    if ((state.totalPages ?? 1) <= (state.currentPage)) return;
    try {
      final currentPage = state.currentPage + 1;
      emit(state.copyWith(
          myClocksStateStatus: MyClocksStateStatus.gettingMoreClocks,
          currentPage: currentPage));
      final clockResponse = await _repository.getMyClocks(page: currentPage);
      final clocks = clockResponse.clocks;
      final oldMyClocks = state.myClocks;
      emit(
        state.copyWith(
          myClocksStateStatus: MyClocksStateStatus.gotClocks,
          myClocks: [...oldMyClocks, ...clocks ?? []],
        ),
      );
    } on Failure catch (e) {
      emit(state.copyWith(
          myClocks: [],
          totalPages: 1,
          myClocksStateStatus: MyClocksStateStatus.gettingClocksError,
          message: e.message));
    } catch (e) {
      emit(state.copyWith(
          myClocks: [],
          totalPages: 1,
          myClocksStateStatus: MyClocksStateStatus.gettingClocksError,
          message: 'An Error Occurred'));
    }
  }

  void changeCheckInStatus({required Clock? workingData}) async {
    emit(state.copyWith(
        workingData: workingData ?? state.workingData,
        checkInStatus: workingData == null
            ? CheckInStateStatus.checkedIn
            : CheckInStateStatus.checkedOut));
  }

  Future<void> checkOut({required DateTime time}) async {
    final isLocationGot = await _getCurrentLocation();
    if (!isLocationGot) return;
    final oldUser = state.user;
    emit(state.copyWith(status: HomeStateStatus.loading));
    final request = ClockRequest(
      longitude: state.currentLocation?.longitude ?? 0.0,
      latitude: state.currentLocation?.latitude ?? 0.0,
      clockOut: time,
    );
    try {
      await _repository.checkOut(request: request);
      emit(state.copyWith(
          user: oldUser?.copyWith(isClockedOut: true),
          checkInStatus: CheckInStateStatus.checkedOut));
    } on Failure catch (e) {
      if (e.message.toString().contains('connection')) {
        emit(state.copyWith(cachedRequest: request));
      }
      emit(state.copyWith(
        status: HomeStateStatus.error,
        message: e.toString(),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HomeStateStatus.error,
        message: 'An Error Occurred',
      ));
    }
  }

  Future<void> checkInWithCachedRequest() async {
    try {
      final cachedRequest = state.cachedRequest;
      if (cachedRequest == null) return;
      final response = await _repository.checkIn(request: cachedRequest);
      changeCheckInStatus(workingData: response);
    } on Failure catch (e) {
      emit(state.copyWith(status: HomeStateStatus.error, message: e.message));
    } catch (e) {
      emit(state.copyWith(
          status: HomeStateStatus.error, message: 'Error Occurred'));
    }
  }

  Future<bool> _getCachedRequest() async {
    try {
      final cachedRequest = await _cacheService.getCachedRequest();
      if (cachedRequest == null) return false;
      emit(state.copyWith(cachedRequest: cachedRequest));
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  void _listenToInternetConnectivity() {
    _internetStatusSubscription = InternetConnection()
        .onStatusChange
        .listen((InternetStatus status) async {
      switch (status) {
        case InternetStatus.connected:
          final hasCachedRequest = await _getCachedRequest();
          if (hasCachedRequest) {
            await checkInWithCachedRequest();
          }
          break;
        case InternetStatus.disconnected:
          break;
      }
    });
  }

  @override
  Future<void> close() {
    _internetStatusSubscription?.cancel();
    return super.close();
  }
}
