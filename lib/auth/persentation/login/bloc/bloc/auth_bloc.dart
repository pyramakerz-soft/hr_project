import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pyramakerz_atendnace/auth/data/models/login/login_reponse.dart';
import 'package:pyramakerz_atendnace/auth/data/models/login/login_request.dart';
import 'package:pyramakerz_atendnace/auth/domain/usecases/login_usecase.dart';
import 'package:pyramakerz_atendnace/core/app-preferances/app_preferances.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.loginUseCase, this._appPreferences) : super(const _Initial()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
        login: (event) async => await _mapLogin(event, emit),
      );
    });
  }

  final LoginUseCase loginUseCase;
  final AppPreferences _appPreferences;
  _mapLogin(_login event, Emitter<AuthState> emit) async {
    emit(const AuthState.loadinglogin());
    final response = await loginUseCase(event.request);
    return await response
        .fold((l) async => emit(AuthState.errorlogin(l.message)), (r1) async {
      _appPreferences.saveToken(r1.token);

      emit(AuthState.successlogin(
        r1,
      ));
    });
  }
}
