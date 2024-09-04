// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

enum HomeStateStatus {
  initial,
  loading,
  loaded,
  checkIn,
  error,
}

enum CheckInStateStatus {
  checkedIn,
  checkedOut,
}

enum MyClocksStateStatus {
  gettingClocks,
  gettingMoreClocks,
  gotClocks,
  gettingClocksError,
}

extension HomeStateX on HomeState {
  bool get isInitial => status == HomeStateStatus.initial;
  bool get isLoading => status == HomeStateStatus.loading;
  bool get isLoaded => status == HomeStateStatus.loaded;
  bool get isError => status == HomeStateStatus.error;

  bool get isCheckIn => checkInStatus == CheckInStateStatus.checkedIn;
}

extension MyClocksStateX on HomeState {
  bool get isGettingClocks =>
      myClocksStateStatus == MyClocksStateStatus.gettingClocks;
  bool get isGotClocks => myClocksStateStatus == MyClocksStateStatus.gotClocks;
  bool get isGettingMoreClocks =>
      myClocksStateStatus == MyClocksStateStatus.gettingMoreClocks;
  bool get isGettingClocksError =>
      myClocksStateStatus == MyClocksStateStatus.gettingClocksError;
}

extension CheckInStateStatusX on HomeState {
  bool get isCheckedIn => checkInStatus == CheckInStateStatus.checkedIn;
  bool get isCheckedOut => checkInStatus == CheckInStateStatus.checkedOut;
}

class HomeState {
  final HomeStateStatus status;
  final CheckInStateStatus? checkInStatus;
  final MyClocksStateStatus? myClocksStateStatus;
  final String? formattedAddress;
  final Position? currentLocation;
  final Clock? workingData;
  final String? message;
  final User? user;
  final List<ClockHistory> myClocks;
  final int currentPage;
  final int? totalPages;
  final bool? isLocationPermissionGranted;
  final ClockRequest? cachedRequest;
  const HomeState(
      {this.status = HomeStateStatus.initial,
      this.myClocksStateStatus,
      this.checkInStatus,
      this.formattedAddress,
      this.workingData,
      this.currentLocation,
      this.user,
      this.message,
      this.myClocks = const [],
      this.currentPage = 1,
      this.totalPages,
      this.isLocationPermissionGranted,
      this.cachedRequest});

  HomeState copyWith(
      {HomeStateStatus? status,
      CheckInStateStatus? checkInStatus,
      Clock? workingData,
      MyClocksStateStatus? myClocksStateStatus,
      String? formattedAddress,
      Position? currentLocation,
      List<ClockHistory>? myClocks,
      User? user,
      String? message,
      int? currentPage,
      int? totalPages,
      bool? isLocationPermissionGranted,
      ClockRequest? cachedRequest}) {
    return HomeState(
        status: status ?? this.status,
        workingData: workingData ?? this.workingData,
        checkInStatus: checkInStatus ?? this.checkInStatus,
        currentLocation: currentLocation ?? this.currentLocation,
        user: user ?? this.user,
        myClocksStateStatus: myClocksStateStatus ?? this.myClocksStateStatus,
        formattedAddress: formattedAddress ?? this.formattedAddress,
        myClocks: myClocks ?? this.myClocks,
        message: message ?? this.message,
        currentPage: currentPage ?? this.currentPage,
        totalPages: totalPages ?? this.totalPages,
        isLocationPermissionGranted:
            isLocationPermissionGranted ?? this.isLocationPermissionGranted,
        cachedRequest: cachedRequest ?? this.cachedRequest);
  }

  @override
  bool operator ==(covariant HomeState other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.workingData == workingData &&
        other.user == user &&
        other.myClocksStateStatus == myClocksStateStatus &&
        other.checkInStatus == checkInStatus &&
        other.formattedAddress == formattedAddress &&
        other.currentLocation == currentLocation &&
        listEquals(other.myClocks, myClocks) &&
        other.currentPage == currentPage &&
        other.totalPages == totalPages &&
        other.cachedRequest == cachedRequest &&
        other.isLocationPermissionGranted == isLocationPermissionGranted &&
        other.message == message;
  }

  @override
  int get hashCode =>
      status.hashCode ^
      workingData.hashCode ^
      checkInStatus.hashCode ^
      formattedAddress.hashCode ^
      user.hashCode ^
      myClocksStateStatus.hashCode ^
      message.hashCode ^
      Object.hashAll(myClocks) ^
      cachedRequest.hashCode ^
      currentPage.hashCode ^
      totalPages.hashCode ^
      isLocationPermissionGranted.hashCode ^
      currentLocation.hashCode;
}
