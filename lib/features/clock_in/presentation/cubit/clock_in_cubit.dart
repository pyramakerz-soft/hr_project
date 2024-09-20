import 'dart:developer';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:pyramakerz_atendnace/core/error/failure.dart';
import 'package:pyramakerz_atendnace/core/services/cache_service.dart';
import 'package:pyramakerz_atendnace/core/services/location_service.dart';
import 'package:pyramakerz_atendnace/core/services/notifications_service.dart';
import 'package:pyramakerz_atendnace/features/auth/data/models/get_profile/location.dart';
import 'package:pyramakerz_atendnace/features/dashboard/data/models/clock_models/clock_request.dart';
import 'package:pyramakerz_atendnace/features/dashboard/data/models/clock_models/clock_response.dart';
import 'package:pyramakerz_atendnace/features/home/data/repository/home_repository.dart';
part 'clock_in_state.dart';

@injectable
class ClockInCubit extends Cubit<ClockInState> {
  final HomeRepository _repository;
  final LocationService _locationService;
  final CacheService _cacheService;

  ClockInCubit({
    required HomeRepository repository,
    required LocationService locationService,
    required CacheService cacheService,
  })  : _repository = repository,
        _locationService = locationService,
        _cacheService = cacheService,
        super(const ClockInState(status: ClockInStateStatus.initial));

  Future<void> checkIn() async {
    final isFromSite = state.locationType == LocationType.site;
    final clockRequest = ClockRequest(
      longitude: state.currentLocation?.longitude ?? 0.0,
      latitude: state.currentLocation?.latitude ?? 0.0,
      isFromSite: isFromSite,
      locationId: state.selectedSite?.locationId,
      clockIn: DateTime.now(),
    );

    try {
      final response = await _repository.checkIn(request: clockRequest);
      await _scheduleNotification();
      emit(state.copyWith(
          status: ClockInStateStatus.checkIn,
          workingData: response,
          message: 'Check In Successful'));
    } on Failure catch (e) {
      if (e.message.contains('connection') || e is SocketException) {
        emit(state.copyWith(
            status: ClockInStateStatus.cached,
            message: 'Check In Cached due to network issue'));
        _cacheRequest(request: clockRequest);
      } else {
        emit(state.copyWith(
            status: ClockInStateStatus.error, message: e.message));
      }
    } catch (e) {
      emit(state.copyWith(
          status: ClockInStateStatus.error, message: 'Error Occurred'));
    }
  }

  Future<void> _cacheRequest({required ClockRequest request}) async {
    try {
      await _cacheService.cacheRequest(request: request);
    } catch (e) {
      emit(state.copyWith(
          status: ClockInStateStatus.error, message: 'Cache Error Happens'));
    }
  }

  void onSiteSelected(Location? siteId) {
    emit(
      state.copyWith(selectedSite: siteId),
    );
  }

  void onLocationTypeChanged(String? locationType) {
    emit(
      state.copyWith(
        locationType:
            LocationType.values.firstWhere((e) => e.name == locationType),
        isLocationSitesEnabled: locationType == LocationType.site.name,
      ),
    );
  }

  Future<void> _scheduleNotification() async {
    try {
      final locationEndTime = state.selectedSite?.locationEndTime;
      if (locationEndTime == null) return;
      // final time = locationEndTime.add(const Duration(hours: 1));
      final time = DateTime.now().add(const Duration(seconds: 5));
      NotificationsService.scheduleNotification(dateTime: time);
    } catch (e) {
      log(e.toString());
    }
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
          status: ClockInStateStatus.gotAddress,
          formattedAddress: 'Network needed to display current address.',
        ),
      );
    }
  }
}
