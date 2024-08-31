// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

enum HomeStateStatus {
  initial,
  loading,
  loaded,
  error,
}

enum AddressStateStatus {
  gettingAddress,
  gotAddress,
  noAddressFound,
}

extension HomeStateX on HomeState {
  bool get isInitial => status == HomeStateStatus.initial;
  bool get isLoading => status == HomeStateStatus.loading;
  bool get isLoaded => status == HomeStateStatus.loaded;
  bool get isError => status == HomeStateStatus.error;
}

extension AddressStateX on HomeState {
  bool get isGettingAddress =>
      addressStatus == AddressStateStatus.gettingAddress;
  bool get isGotAddress => addressStatus == AddressStateStatus.gotAddress;
  bool get isNoAddressFound =>
      addressStatus == AddressStateStatus.noAddressFound;
}

class HomeState {
  final HomeStateStatus status;
  final AddressStateStatus? addressStatus;
  final String? formattedAddress;
  final Position? currentLocation;
  final Clock? workingData;
  final String? error;
  const HomeState({
    this.status = HomeStateStatus.initial,
    this.addressStatus,
    this.formattedAddress,
    this.workingData,
    this.currentLocation,
    this.error,
  });

  HomeState copyWith({
    HomeStateStatus? status,
    AddressStateStatus? addressStatus,
    Clock? workingData,
    String? formattedAddress,
    Position? currentLocation,
    String? error,
  }) {
    return HomeState(
      status: status ?? this.status,
      workingData: workingData ?? this.workingData,
      addressStatus: addressStatus ?? this.addressStatus,
      currentLocation: currentLocation ?? this.currentLocation,
      formattedAddress: formattedAddress ?? this.formattedAddress,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(covariant HomeState other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.workingData == workingData &&
        other.addressStatus == addressStatus &&
        other.formattedAddress == formattedAddress &&
        other.currentLocation == currentLocation &&
        other.error == error;
  }

  @override
  int get hashCode =>
      status.hashCode ^
      workingData.hashCode ^
      addressStatus.hashCode ^
      formattedAddress.hashCode ^
      error.hashCode ^
      currentLocation.hashCode;
}
