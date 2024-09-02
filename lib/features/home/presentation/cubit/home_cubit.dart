import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:pyramakerz_atendnace/core/services/location_service.dart';
import 'package:pyramakerz_atendnace/features/auth/data/models/get_profile/user_reponse.dart';
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
    await _locationService.askForPermissionIfNeeded();
    emit(
      state.copyWith(
        user: user,
        checkInStatus: user.isClockedOut == true
            ? CheckInStateStatus.checkedIn
            : CheckInStateStatus.checkedOut,
      ),
    );
  }

  Future<void> getCurrentLocation() async {
    try {
      final position = await _locationService.getCurrentLocation();
      emit(state.copyWith(currentLocation: position));
    } catch (e) {
      emit(state.copyWith(status: HomeStateStatus.error, error: e.toString()));
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
