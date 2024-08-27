part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

   const factory AuthState.loadingLogin( ) = _loadingLogin;
  const factory AuthState.successLogin(LoginResponse response, ) = _successLogin;
  const factory AuthState.errorLogin(String err,) = errorLogin;



   const factory AuthState.loadingLoginWithToken( ) = _loadingLoginWithToken;
  const factory AuthState.successLoginWithToken(User user, ) = _successLoginWithToken;
  const factory AuthState.errorLoginWithToken(String err,) = _errorLoginWithToken;
}
