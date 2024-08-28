part of 'clock_bloc.dart';

@freezed
class ClockEvent with _$ClockEvent {
  const factory ClockEvent.clockIn(ClockRequest request) = _clockIn;

    const factory ClockEvent.clockOut(ClockRequest request) = _clockOut;

}