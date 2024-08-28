part of 'clock_bloc.dart';

@freezed
class ClockState with _$ClockState {
  const factory ClockState.initial() = _Initial;



    const factory ClockState.loadingClocking() = _loadingClocking;
  const factory ClockState.errorClocking(String err) = _errorClocking;
  const factory ClockState.successClocking(ClockResponse resp) = _successClocking;

}
