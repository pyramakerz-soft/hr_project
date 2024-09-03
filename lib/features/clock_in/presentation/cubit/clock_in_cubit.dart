import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:pyramakerz_atendnace/core/error/failure.dart';
import 'package:pyramakerz_atendnace/core/services/location_service.dart';
import 'package:pyramakerz_atendnace/features/dashboard/data/models/clock_models/clock_request.dart';
import 'package:pyramakerz_atendnace/features/dashboard/data/models/clock_models/clock_response.dart';
import 'package:pyramakerz_atendnace/features/home/data/repository/home_repository.dart';
part 'clock_in_state.dart';

@injectable
class ClockInCubit extends Cubit<ClockInState> {
  final HomeRepository _repository;
  final LocationService _locationService;
  ClockInCubit(
      {required HomeRepository repository,
      required LocationService locationService})
      : _repository = repository,
        _locationService = locationService,
        super(const ClockInState(status: ClockInStateStatus.initial));

  Future<void> checkIn() async {
    final isFromSite = state.locationType == LocationType.site;
    try {
      final response = await _repository.checkIn(
        request: ClockRequest(
          longitude: state.currentLocation?.longitude ?? 0.0,
          latitude: state.currentLocation?.latitude ?? 0.0,
          isFromSite: isFromSite,
          clockIn: DateTime.now(),
        ),
      );
      emit(
        state.copyWith(
            status: ClockInStateStatus.checkIn,
            workingData: response,
            message: 'Check In Successful'),
      );
    } on Failure catch (e) {
      emit(
          state.copyWith(status: ClockInStateStatus.error, message: e.message));
    } catch (e) {
      emit(state.copyWith(
          status: ClockInStateStatus.error, message: 'Error Occurred'));
    }
  }

  void onLocationTypeChanged(String? locationType) {
    emit(
      state.copyWith(
        locationType:
            LocationType.values.firstWhere((e) => e.name == locationType),
      ),
    );
  }

  Future<void> getCurrentLocation() async {
    emit(state.copyWith(status: ClockInStateStatus.gettingAddress));
    try {
      await _locationService.askForPermissionIfNeeded();
      final position = await _locationService.getCurrentLocation();

      if (position == null) return;
      emit(state.copyWith(currentLocation: position));
      _getFormattedAddress(position.latitude, position.longitude);
    } catch (e) {
      emit(state.copyWith(
          status: ClockInStateStatus.error, message: e.toString()));
    }
  }

  Future<void> _getFormattedAddress(double latitude, double longitude) async {
    try {
      final formattedAddress = await _locationService.getFormattedAddress(
          latitude: latitude, longitude: longitude);
      emit(
        state.copyWith(
          status: ClockInStateStatus.gotAddress,
          formattedAddress: formattedAddress,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ClockInStateStatus.error,
          message: e.toString(),
        ),
      );
    }
  }
}
