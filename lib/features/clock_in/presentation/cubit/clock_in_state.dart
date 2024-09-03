part of 'clock_in_cubit.dart';

enum ClockInStateStatus {
  initial,
  gettingAddress,
  gotAddress,
  error,
  checkIn,
}

extension AddressStateX on ClockInState {
  bool get isInitial => status == ClockInStateStatus.initial;
  bool get isGettingAddress => status == ClockInStateStatus.gettingAddress;
  bool get isGotAddress => status == ClockInStateStatus.gotAddress;
  bool get isError => status == ClockInStateStatus.error;
  bool get isCheckIn => status == ClockInStateStatus.checkIn;
}

class ClockInState {
  final ClockInStateStatus status;
  final String? formattedAddress;
  final Position? currentLocation;
  final LocationType locationType;
  final Clock? workingData;
  final String? message;
  const ClockInState({
    this.status = ClockInStateStatus.gettingAddress,
    this.formattedAddress,
    this.workingData,
    this.locationType = LocationType.site,
    this.currentLocation,
    this.message,
  });

  ClockInState copyWith({
    ClockInStateStatus? status,
    Clock? workingData,
    String? formattedAddress,
    Position? currentLocation,
    LocationType? locationType,
    String? message,
  }) {
    return ClockInState(
      workingData: workingData ?? this.workingData,
      status: status ?? this.status,
      currentLocation: currentLocation ?? this.currentLocation,
      formattedAddress: formattedAddress ?? this.formattedAddress,
      message: message ?? this.message,
      locationType: locationType ?? this.locationType,
    );
  }

  @override
  bool operator ==(covariant ClockInState other) {
    if (identical(this, other)) return true;

    return other.workingData == workingData &&
        other.status == status &&
        other.formattedAddress == formattedAddress &&
        other.locationType == locationType &&
        other.currentLocation == currentLocation &&
        other.message == message;
  }

  @override
  int get hashCode =>
      workingData.hashCode ^
      status.hashCode ^
      formattedAddress.hashCode ^
      locationType.hashCode ^
      message.hashCode ^
      currentLocation.hashCode;
}
