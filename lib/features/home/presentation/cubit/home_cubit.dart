import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:pyramakerz_atendnace/core/error/failure.dart';
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
  HomeCubit(
      {required HomeRepository repository,
      required LocationService locationService})
      : _repository = repository,
        _locationService = locationService,
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
          error: 'Permission not granted!'));
    }
  }

  Future<bool> _getCurrentLocation() async {
    try {
      final position = await _locationService.getCurrentLocation();
      emit(state.copyWith(currentLocation: position));
      return true;
    } catch (e) {
      emit(state.copyWith(status: HomeStateStatus.error, error: e.toString()));
      return false;
    }
  }

  Future<void> refresh() => getMyClocks();
  Future<void> getMyClocks() async {
    emit(
        state.copyWith(myClocksStateStatus: MyClocksStateStatus.gettingClocks));
    try {
      final myClocksResponse =
          await _repository.getMyClocks(page: state.currentPage);
      final clocks = myClocksResponse.clocks;
      final myOldClocks = state.myClocks;
      emit(state.copyWith(
          myClocks: [...myOldClocks, ...clocks ?? []],
          totalPages: myClocksResponse.pagination?.lastPage ?? 1,
          myClocksStateStatus: MyClocksStateStatus.gotClocks));
    } on Failure catch (e) {
      emit(state.copyWith(
          myClocks: [],
          totalPages: 1,
          myClocksStateStatus: MyClocksStateStatus.gettingClocksError,
          error: e.message));
    } catch (e) {
      emit(state.copyWith(
          myClocks: [],
          myClocksStateStatus: MyClocksStateStatus.gettingClocksError,
          error: 'An Error Occurred'));
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
          error: e.message));
    } catch (e) {
      emit(state.copyWith(
          myClocks: [],
          totalPages: 1,
          myClocksStateStatus: MyClocksStateStatus.gettingClocksError,
          error: 'An Error Occurred'));
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
    try {
      await _repository.checkOut(
          request: ClockRequest(
        longitude: state.currentLocation?.longitude ?? 0.0,
        latitude: state.currentLocation?.latitude ?? 0.0,
        clockOut: time,
      ));
      emit(state.copyWith(
          user: oldUser?.copyWith(isClockedOut: true),
          checkInStatus: CheckInStateStatus.checkedOut));
    } catch (e) {
      emit(state.copyWith(
        status: HomeStateStatus.error,
        error: e.toString(),
      ));
    }
  }
}
