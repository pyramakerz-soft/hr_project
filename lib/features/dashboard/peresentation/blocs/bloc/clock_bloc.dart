import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pyramakerz_atendnace/features/dashboard/data/models/clock_models/clock_request.dart';
import 'package:pyramakerz_atendnace/features/dashboard/data/models/clock_models/clock_response.dart';
import 'package:pyramakerz_atendnace/features/dashboard/domain/usecases/clockin_usecase.dart';
import 'package:pyramakerz_atendnace/features/dashboard/domain/usecases/clockout_usecase.dart';

part 'clock_bloc.freezed.dart';
part 'clock_event.dart';
part 'clock_state.dart';

class ClockBloc extends Bloc<ClockEvent, ClockState> {
  ClockBloc(this.clockinUsecase, this.clockOutUsecase)
      : super(const _Initial()) {
    on<ClockEvent>((event, emit) async {
      await event.map(
        clockIn: (event) async => await _mapClockIn(event, emit),
        clockOut: (event) async => await _mapClockOut(event, emit),
      );
    });
  }

  final ClockinUsecase clockinUsecase;
  final ClockOutUsecase clockOutUsecase;

  _mapClockOut(_clockOut event, Emitter<ClockState> emit) async {
    emit(const ClockState.loadingClocking());
    final response = await clockOutUsecase(event.request);
    return await response.fold(
        (l) async => emit(ClockState.errorClocking(l.message)), (r1) async {
      emit(ClockState.successClocking(r1));
    });
  }

  _mapClockIn(_clockIn event, Emitter<ClockState> emit) async {
    emit(const ClockState.loadingClocking());
    final response = await clockinUsecase(event.request);
    return await response.fold(
        (l) async => emit(ClockState.errorClocking(l.message)), (r1) async {
      emit(ClockState.successClocking(r1));
    });
  }
}
