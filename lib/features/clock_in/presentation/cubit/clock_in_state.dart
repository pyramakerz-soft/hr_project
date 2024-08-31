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
  bool get isNoAddressFound => status == ClockInStateStatus.error;
  bool get isCheckIn => status == ClockInStateStatus.checkIn;
}

class ClockInState {
  final ClockInStateStatus status;
  final String? formattedAddress;
  final Position? currentLocation;
  final Clock? workingData;
  final String? error;
  const ClockInState({
    this.status = ClockInStateStatus.gettingAddress,
    this.formattedAddress,
    this.workingData,
    this.currentLocation,
    this.error,
  });

  ClockInState copyWith({
    ClockInStateStatus? status,
    Clock? workingData,
    String? formattedAddress,
    Position? currentLocation,
    String? error,
  }) {
    return ClockInState(
      workingData: workingData ?? this.workingData,
      status: status ?? this.status,
      currentLocation: currentLocation ?? this.currentLocation,
      formattedAddress: formattedAddress ?? this.formattedAddress,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(covariant ClockInState other) {
    if (identical(this, other)) return true;

    return other.workingData == workingData &&
        other.status == status &&
        other.formattedAddress == formattedAddress &&
        other.currentLocation == currentLocation &&
        other.error == error;
  }

  @override
  int get hashCode =>
      workingData.hashCode ^
      status.hashCode ^
      formattedAddress.hashCode ^
      error.hashCode ^
      currentLocation.hashCode;
}
