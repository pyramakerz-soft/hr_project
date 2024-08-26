part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

   const factory AuthState.loadinglogin( ) = _loadinglogin;
  const factory AuthState.successlogin(LoginResponse response, ) = _successlogin;
  const factory AuthState.errorlogin(String err,) = errorlogin;

}
