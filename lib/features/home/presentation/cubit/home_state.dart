// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

enum HomeStateStatus {
  initial,
  loading,
  loaded,
  error,
}

enum CheckInStateStatus {
  checkedIn,
  checkedOut,
}

extension HomeStateX on HomeState {
  bool get isInitial => status == HomeStateStatus.initial;
  bool get isLoading => status == HomeStateStatus.loading;
  bool get isLoaded => status == HomeStateStatus.loaded;
  bool get isError => status == HomeStateStatus.error;
}

extension CheckInStateStatusX on HomeState {
  bool get isCheckedIn => checkInStatus == CheckInStateStatus.checkedIn;
  bool get isCheckedOut => checkInStatus == CheckInStateStatus.checkedOut;
}

class HomeState {
  final HomeStateStatus status;
  final CheckInStateStatus? checkInStatus;
  final String? formattedAddress;
  final Position? currentLocation;
  final Clock? workingData;
  final String? error;
  final User? user;
  const HomeState({
    this.status = HomeStateStatus.initial,
    this.checkInStatus,
    this.formattedAddress,
    this.workingData,
    this.currentLocation,
    this.user,
    this.error,
  });

  HomeState copyWith({
    HomeStateStatus? status,
    CheckInStateStatus? checkInStatus,
    Clock? workingData,
    String? formattedAddress,
    Position? currentLocation,
    User? user,
    String? error,
  }) {
    return HomeState(
      status: status ?? this.status,
      workingData: workingData ?? this.workingData,
      checkInStatus: checkInStatus ?? this.checkInStatus,
      currentLocation: currentLocation ?? this.currentLocation,
      user: user ?? this.user,
      formattedAddress: formattedAddress ?? this.formattedAddress,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(covariant HomeState other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.workingData == workingData &&
        other.user == user &&
        other.checkInStatus == checkInStatus &&
        other.formattedAddress == formattedAddress &&
        other.currentLocation == currentLocation &&
        other.error == error;
  }

  @override
  int get hashCode =>
      status.hashCode ^
      workingData.hashCode ^
      checkInStatus.hashCode ^
      formattedAddress.hashCode ^
      user.hashCode ^
      error.hashCode ^
      currentLocation.hashCode;
}
