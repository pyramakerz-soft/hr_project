import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:pyramakerz_atendnace/core/services/location_service.dart';
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

  Future<void> init() async {
    await _locationService.askForPermissionIfNeeded();
  }

  Future<void> checkIn({required ClockRequest request}) async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    try {
      final response = await _repository.checkIn(request: ClockRequest());
      emit(state.copyWith(
          status: HomeStateStatus.loaded, workingData: response));
    } catch (e) {
      emit(state.copyWith(status: HomeStateStatus.error, error: e.toString()));
    }
  }

  Future<void> checkOut({required ClockRequest request}) async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    try {
      final response = await _repository.checkOut(request: ClockRequest());
      emit(state.copyWith(
          status: HomeStateStatus.loaded, workingData: response));
    } catch (e) {
      emit(state.copyWith(status: HomeStateStatus.error, error: e.toString()));
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      final position = await _locationService.getCurrentLocation();
      if (position == null) return;
      _getFormattedAddress(position.latitude, position.longitude);
    } catch (e) {
      emit(state.copyWith(
          addressStatus: AddressStateStatus.noAddressFound,
          error: e.toString()));
    }
  }

  Future<void> _getFormattedAddress(double latitude, double longitude) async {
    try {
      final formattedAddress = await _locationService.getFormattedAddress(
          latitude: latitude, longitude: longitude);
      emit(
        state.copyWith(
          addressStatus: AddressStateStatus.gotAddress,
          formattedAddress: formattedAddress,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          addressStatus: AddressStateStatus.noAddressFound,
          error: e.toString(),
        ),
      );
    }
  }
}
