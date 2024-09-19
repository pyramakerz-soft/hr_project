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
import 'package:pyramakerz_atendnace/core/services/notifications_service.dart';
import 'package:pyramakerz_atendnace/core/usecase/base_usecase.dart';
import 'package:pyramakerz_atendnace/features/auth/data/models/get_profile/user_reponse.dart';
import 'package:pyramakerz_atendnace/features/auth/domain/usecases/get_profile_usecase.dart';
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
  final GetProfileUsecase _getProfileUsecase;
  final NotificationsService _notificationsService;
  StreamSubscription<InternetStatus>? _internetStatusSubscription;

  HomeCubit(
      {required HomeRepository repository,
      required LocationService locationService,
      required CacheService cacheService,
      required GetProfileUsecase getProfileUsecase,
      required NotificationsService notificationsService})
      : _repository = repository,
        _locationService = locationService,
        _cacheService = cacheService,
        _getProfileUsecase = getProfileUsecase,
        _notificationsService = notificationsService,
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
    await askForLocationPermission();
    await askForNotificationsPermission();
    _listenToInternetConnectivity();
  }

  Future<void> askForLocationPermission() async {
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

  Future<void> askForNotificationsPermission() async {
    try {
      // Request notification permission and get the result
      final bool isPermissionGranted =
          await _notificationsService.requestPermissionIfNeeded();

      // If the permission is not granted, log and return
      if (!isPermissionGranted) {
        log('Notification permission not granted.');
        return;
      }

      // Proceed with additional logic if permission is granted
      log('Notification permission granted.');
    } catch (e, stackTrace) {
      // Log any potential errors with stack trace for better debugging
      log('Error requesting notification permission: $e');
      log('StackTrace: $stackTrace');
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
    final response = await _getProfileUsecase(NoParameters());
    response.fold((l) => null, (r) => emit(state.copyWith(user: r)));
    emit(state.copyWith(
      cachedRequest: null,
      workingData: workingData ?? state.workingData,
    ));
    emit(state.copyWith(
      checkInStatus: state.user?.isClockedOut == true
          ? CheckInStateStatus.checkedIn
          : CheckInStateStatus.checkedOut,
    ));
    getMyClocks();
  }

  Future<bool> checkOut({DateTime? time, bool cached = false}) async {
    final isLocationGot = await _getCurrentLocation();
    if (!isLocationGot) {
      emit(state.copyWith(
        message: 'Cannot Find Your Location',
      ));
      return false;
    }
    emit(state.copyWith(status: HomeStateStatus.loading));
    final request = cached
        ? state.cachedRequest
        : ClockRequest(
            longitude: state.currentLocation?.longitude ?? 0.0,
            latitude: state.currentLocation?.latitude ?? 0.0,
            clockOut: time,
          );
    try {
      await _repository.checkOut(request: request!);
      emit(state.copyWith(
        checkInStatus: CheckInStateStatus.checkedOut,
        cachedRequest: null,
      ));
      return true;
    } on Failure catch (e) {
      if (e.message.contains('connection') || e is SocketException) {
        _cacheRequest(request: request!);
        emit(state.copyWith(message: 'Check Out Cached due to network issue'));
        return false;
      }
      emit(state.copyWith(message: e.message));
      return false;
    } catch (e) {
      emit(state.copyWith(
          status: HomeStateStatus.error, message: 'Error Occurred'));
      return true;
    }
  }

  Future<void> _cacheRequest({required ClockRequest request}) async {
    try {
      await _cacheService.cacheRequest(request: request);
      emit(state.copyWith(cachedRequest: request));
    } catch (e) {
      emit(state.copyWith(
          status: HomeStateStatus.error, message: 'Cache Error Happens'));
    }
  }

  Future<void> resendCacheRequest() async {
    try {
      final cachedRequest = state.cachedRequest;
      if (cachedRequest == null) return;
      final isCheckIn = cachedRequest.clockIn != null;

      if (isCheckIn) {
        final response = await _repository.checkIn(request: cachedRequest);

        changeCheckInStatus(workingData: response);
      } else {
        await checkOut(time: cachedRequest.clockOut!, cached: true);
        changeCheckInStatus(workingData: null);
      }

      emit(state.copyWith(cachedRequest: null));
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
      emit(state.copyWith(
        cachedRequest: cachedRequest,
      ));
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
            resendCacheRequest();
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
