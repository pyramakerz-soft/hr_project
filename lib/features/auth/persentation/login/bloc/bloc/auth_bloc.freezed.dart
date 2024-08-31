// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginRequest request) login,
    required TResult Function() getHomeData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginRequest request)? login,
    TResult? Function()? getHomeData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginRequest request)? login,
    TResult Function()? getHomeData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_login value) login,
    required TResult Function(_loginWithToken value) getHomeData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_login value)? login,
    TResult? Function(_loginWithToken value)? getHomeData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_login value)? login,
    TResult Function(_loginWithToken value)? getHomeData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$loginImplCopyWith<$Res> {
  factory _$$loginImplCopyWith(
          _$loginImpl value, $Res Function(_$loginImpl) then) =
      __$$loginImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LoginRequest request});
}

/// @nodoc
class __$$loginImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$loginImpl>
    implements _$$loginImplCopyWith<$Res> {
  __$$loginImplCopyWithImpl(
      _$loginImpl _value, $Res Function(_$loginImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$loginImpl(
      null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as LoginRequest,
    ));
  }
}

/// @nodoc

class _$loginImpl implements _login {
  const _$loginImpl(this.request);

  @override
  final LoginRequest request;

  @override
  String toString() {
    return 'AuthEvent.login(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$loginImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$loginImplCopyWith<_$loginImpl> get copyWith =>
      __$$loginImplCopyWithImpl<_$loginImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginRequest request) login,
    required TResult Function() getHomeData,
  }) {
    return login(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginRequest request)? login,
    TResult? Function()? getHomeData,
  }) {
    return login?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginRequest request)? login,
    TResult Function()? getHomeData,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_login value) login,
    required TResult Function(_loginWithToken value) getHomeData,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_login value)? login,
    TResult? Function(_loginWithToken value)? getHomeData,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_login value)? login,
    TResult Function(_loginWithToken value)? getHomeData,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class _login implements AuthEvent {
  const factory _login(final LoginRequest request) = _$loginImpl;

  LoginRequest get request;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$loginImplCopyWith<_$loginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$loginWithTokenImplCopyWith<$Res> {
  factory _$$loginWithTokenImplCopyWith(_$loginWithTokenImpl value,
          $Res Function(_$loginWithTokenImpl) then) =
      __$$loginWithTokenImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$loginWithTokenImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$loginWithTokenImpl>
    implements _$$loginWithTokenImplCopyWith<$Res> {
  __$$loginWithTokenImplCopyWithImpl(
      _$loginWithTokenImpl _value, $Res Function(_$loginWithTokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$loginWithTokenImpl implements _loginWithToken {
  const _$loginWithTokenImpl();

  @override
  String toString() {
    return 'AuthEvent.getHomeData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$loginWithTokenImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginRequest request) login,
    required TResult Function() getHomeData,
  }) {
    return getHomeData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginRequest request)? login,
    TResult? Function()? getHomeData,
  }) {
    return getHomeData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginRequest request)? login,
    TResult Function()? getHomeData,
    required TResult orElse(),
  }) {
    if (getHomeData != null) {
      return getHomeData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_login value) login,
    required TResult Function(_loginWithToken value) getHomeData,
  }) {
    return getHomeData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_login value)? login,
    TResult? Function(_loginWithToken value)? getHomeData,
  }) {
    return getHomeData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_login value)? login,
    TResult Function(_loginWithToken value)? getHomeData,
    required TResult orElse(),
  }) {
    if (getHomeData != null) {
      return getHomeData(this);
    }
    return orElse();
  }
}

abstract class _loginWithToken implements AuthEvent {
  const factory _loginWithToken() = _$loginWithTokenImpl;
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingLogin,
    required TResult Function(LoginResponse response) successLogin,
    required TResult Function(String err) errorLogin,
    required TResult Function() loadingLoginWithToken,
    required TResult Function(User user) getHomeDataSucceed,
    required TResult Function(String err) getHomeDataError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingLogin,
    TResult? Function(LoginResponse response)? successLogin,
    TResult? Function(String err)? errorLogin,
    TResult? Function()? loadingLoginWithToken,
    TResult? Function(User user)? getHomeDataSucceed,
    TResult? Function(String err)? getHomeDataError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingLogin,
    TResult Function(LoginResponse response)? successLogin,
    TResult Function(String err)? errorLogin,
    TResult Function()? loadingLoginWithToken,
    TResult Function(User user)? getHomeDataSucceed,
    TResult Function(String err)? getHomeDataError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loadingLogin value) loadingLogin,
    required TResult Function(_successLogin value) successLogin,
    required TResult Function(errorLogin value) errorLogin,
    required TResult Function(_loadingLoginWithToken value)
        loadingLoginWithToken,
    required TResult Function(_successLoginWithToken value) getHomeDataSucceed,
    required TResult Function(_errorLoginWithToken value) getHomeDataError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loadingLogin value)? loadingLogin,
    TResult? Function(_successLogin value)? successLogin,
    TResult? Function(errorLogin value)? errorLogin,
    TResult? Function(_loadingLoginWithToken value)? loadingLoginWithToken,
    TResult? Function(_successLoginWithToken value)? getHomeDataSucceed,
    TResult? Function(_errorLoginWithToken value)? getHomeDataError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loadingLogin value)? loadingLogin,
    TResult Function(_successLogin value)? successLogin,
    TResult Function(errorLogin value)? errorLogin,
    TResult Function(_loadingLoginWithToken value)? loadingLoginWithToken,
    TResult Function(_successLoginWithToken value)? getHomeDataSucceed,
    TResult Function(_errorLoginWithToken value)? getHomeDataError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingLogin,
    required TResult Function(LoginResponse response) successLogin,
    required TResult Function(String err) errorLogin,
    required TResult Function() loadingLoginWithToken,
    required TResult Function(User user) getHomeDataSucceed,
    required TResult Function(String err) getHomeDataError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingLogin,
    TResult? Function(LoginResponse response)? successLogin,
    TResult? Function(String err)? errorLogin,
    TResult? Function()? loadingLoginWithToken,
    TResult? Function(User user)? getHomeDataSucceed,
    TResult? Function(String err)? getHomeDataError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingLogin,
    TResult Function(LoginResponse response)? successLogin,
    TResult Function(String err)? errorLogin,
    TResult Function()? loadingLoginWithToken,
    TResult Function(User user)? getHomeDataSucceed,
    TResult Function(String err)? getHomeDataError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loadingLogin value) loadingLogin,
    required TResult Function(_successLogin value) successLogin,
    required TResult Function(errorLogin value) errorLogin,
    required TResult Function(_loadingLoginWithToken value)
        loadingLoginWithToken,
    required TResult Function(_successLoginWithToken value) getHomeDataSucceed,
    required TResult Function(_errorLoginWithToken value) getHomeDataError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loadingLogin value)? loadingLogin,
    TResult? Function(_successLogin value)? successLogin,
    TResult? Function(errorLogin value)? errorLogin,
    TResult? Function(_loadingLoginWithToken value)? loadingLoginWithToken,
    TResult? Function(_successLoginWithToken value)? getHomeDataSucceed,
    TResult? Function(_errorLoginWithToken value)? getHomeDataError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loadingLogin value)? loadingLogin,
    TResult Function(_successLogin value)? successLogin,
    TResult Function(errorLogin value)? errorLogin,
    TResult Function(_loadingLoginWithToken value)? loadingLoginWithToken,
    TResult Function(_successLoginWithToken value)? getHomeDataSucceed,
    TResult Function(_errorLoginWithToken value)? getHomeDataError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$loadingLoginImplCopyWith<$Res> {
  factory _$$loadingLoginImplCopyWith(
          _$loadingLoginImpl value, $Res Function(_$loadingLoginImpl) then) =
      __$$loadingLoginImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$loadingLoginImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$loadingLoginImpl>
    implements _$$loadingLoginImplCopyWith<$Res> {
  __$$loadingLoginImplCopyWithImpl(
      _$loadingLoginImpl _value, $Res Function(_$loadingLoginImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$loadingLoginImpl implements _loadingLogin {
  const _$loadingLoginImpl();

  @override
  String toString() {
    return 'AuthState.loadingLogin()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$loadingLoginImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingLogin,
    required TResult Function(LoginResponse response) successLogin,
    required TResult Function(String err) errorLogin,
    required TResult Function() loadingLoginWithToken,
    required TResult Function(User user) getHomeDataSucceed,
    required TResult Function(String err) getHomeDataError,
  }) {
    return loadingLogin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingLogin,
    TResult? Function(LoginResponse response)? successLogin,
    TResult? Function(String err)? errorLogin,
    TResult? Function()? loadingLoginWithToken,
    TResult? Function(User user)? getHomeDataSucceed,
    TResult? Function(String err)? getHomeDataError,
  }) {
    return loadingLogin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingLogin,
    TResult Function(LoginResponse response)? successLogin,
    TResult Function(String err)? errorLogin,
    TResult Function()? loadingLoginWithToken,
    TResult Function(User user)? getHomeDataSucceed,
    TResult Function(String err)? getHomeDataError,
    required TResult orElse(),
  }) {
    if (loadingLogin != null) {
      return loadingLogin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loadingLogin value) loadingLogin,
    required TResult Function(_successLogin value) successLogin,
    required TResult Function(errorLogin value) errorLogin,
    required TResult Function(_loadingLoginWithToken value)
        loadingLoginWithToken,
    required TResult Function(_successLoginWithToken value) getHomeDataSucceed,
    required TResult Function(_errorLoginWithToken value) getHomeDataError,
  }) {
    return loadingLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loadingLogin value)? loadingLogin,
    TResult? Function(_successLogin value)? successLogin,
    TResult? Function(errorLogin value)? errorLogin,
    TResult? Function(_loadingLoginWithToken value)? loadingLoginWithToken,
    TResult? Function(_successLoginWithToken value)? getHomeDataSucceed,
    TResult? Function(_errorLoginWithToken value)? getHomeDataError,
  }) {
    return loadingLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loadingLogin value)? loadingLogin,
    TResult Function(_successLogin value)? successLogin,
    TResult Function(errorLogin value)? errorLogin,
    TResult Function(_loadingLoginWithToken value)? loadingLoginWithToken,
    TResult Function(_successLoginWithToken value)? getHomeDataSucceed,
    TResult Function(_errorLoginWithToken value)? getHomeDataError,
    required TResult orElse(),
  }) {
    if (loadingLogin != null) {
      return loadingLogin(this);
    }
    return orElse();
  }
}

abstract class _loadingLogin implements AuthState {
  const factory _loadingLogin() = _$loadingLoginImpl;
}

/// @nodoc
abstract class _$$successLoginImplCopyWith<$Res> {
  factory _$$successLoginImplCopyWith(
          _$successLoginImpl value, $Res Function(_$successLoginImpl) then) =
      __$$successLoginImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LoginResponse response});
}

/// @nodoc
class __$$successLoginImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$successLoginImpl>
    implements _$$successLoginImplCopyWith<$Res> {
  __$$successLoginImplCopyWithImpl(
      _$successLoginImpl _value, $Res Function(_$successLoginImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$successLoginImpl(
      null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as LoginResponse,
    ));
  }
}

/// @nodoc

class _$successLoginImpl implements _successLogin {
  const _$successLoginImpl(this.response);

  @override
  final LoginResponse response;

  @override
  String toString() {
    return 'AuthState.successLogin(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$successLoginImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$successLoginImplCopyWith<_$successLoginImpl> get copyWith =>
      __$$successLoginImplCopyWithImpl<_$successLoginImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingLogin,
    required TResult Function(LoginResponse response) successLogin,
    required TResult Function(String err) errorLogin,
    required TResult Function() loadingLoginWithToken,
    required TResult Function(User user) getHomeDataSucceed,
    required TResult Function(String err) getHomeDataError,
  }) {
    return successLogin(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingLogin,
    TResult? Function(LoginResponse response)? successLogin,
    TResult? Function(String err)? errorLogin,
    TResult? Function()? loadingLoginWithToken,
    TResult? Function(User user)? getHomeDataSucceed,
    TResult? Function(String err)? getHomeDataError,
  }) {
    return successLogin?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingLogin,
    TResult Function(LoginResponse response)? successLogin,
    TResult Function(String err)? errorLogin,
    TResult Function()? loadingLoginWithToken,
    TResult Function(User user)? getHomeDataSucceed,
    TResult Function(String err)? getHomeDataError,
    required TResult orElse(),
  }) {
    if (successLogin != null) {
      return successLogin(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loadingLogin value) loadingLogin,
    required TResult Function(_successLogin value) successLogin,
    required TResult Function(errorLogin value) errorLogin,
    required TResult Function(_loadingLoginWithToken value)
        loadingLoginWithToken,
    required TResult Function(_successLoginWithToken value) getHomeDataSucceed,
    required TResult Function(_errorLoginWithToken value) getHomeDataError,
  }) {
    return successLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loadingLogin value)? loadingLogin,
    TResult? Function(_successLogin value)? successLogin,
    TResult? Function(errorLogin value)? errorLogin,
    TResult? Function(_loadingLoginWithToken value)? loadingLoginWithToken,
    TResult? Function(_successLoginWithToken value)? getHomeDataSucceed,
    TResult? Function(_errorLoginWithToken value)? getHomeDataError,
  }) {
    return successLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loadingLogin value)? loadingLogin,
    TResult Function(_successLogin value)? successLogin,
    TResult Function(errorLogin value)? errorLogin,
    TResult Function(_loadingLoginWithToken value)? loadingLoginWithToken,
    TResult Function(_successLoginWithToken value)? getHomeDataSucceed,
    TResult Function(_errorLoginWithToken value)? getHomeDataError,
    required TResult orElse(),
  }) {
    if (successLogin != null) {
      return successLogin(this);
    }
    return orElse();
  }
}

abstract class _successLogin implements AuthState {
  const factory _successLogin(final LoginResponse response) =
      _$successLoginImpl;

  LoginResponse get response;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$successLoginImplCopyWith<_$successLoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$errorLoginImplCopyWith<$Res> {
  factory _$$errorLoginImplCopyWith(
          _$errorLoginImpl value, $Res Function(_$errorLoginImpl) then) =
      __$$errorLoginImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String err});
}

/// @nodoc
class __$$errorLoginImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$errorLoginImpl>
    implements _$$errorLoginImplCopyWith<$Res> {
  __$$errorLoginImplCopyWithImpl(
      _$errorLoginImpl _value, $Res Function(_$errorLoginImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$errorLoginImpl(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$errorLoginImpl implements errorLogin {
  const _$errorLoginImpl(this.err);

  @override
  final String err;

  @override
  String toString() {
    return 'AuthState.errorLogin(err: $err)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$errorLoginImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$errorLoginImplCopyWith<_$errorLoginImpl> get copyWith =>
      __$$errorLoginImplCopyWithImpl<_$errorLoginImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingLogin,
    required TResult Function(LoginResponse response) successLogin,
    required TResult Function(String err) errorLogin,
    required TResult Function() loadingLoginWithToken,
    required TResult Function(User user) getHomeDataSucceed,
    required TResult Function(String err) getHomeDataError,
  }) {
    return errorLogin(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingLogin,
    TResult? Function(LoginResponse response)? successLogin,
    TResult? Function(String err)? errorLogin,
    TResult? Function()? loadingLoginWithToken,
    TResult? Function(User user)? getHomeDataSucceed,
    TResult? Function(String err)? getHomeDataError,
  }) {
    return errorLogin?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingLogin,
    TResult Function(LoginResponse response)? successLogin,
    TResult Function(String err)? errorLogin,
    TResult Function()? loadingLoginWithToken,
    TResult Function(User user)? getHomeDataSucceed,
    TResult Function(String err)? getHomeDataError,
    required TResult orElse(),
  }) {
    if (errorLogin != null) {
      return errorLogin(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loadingLogin value) loadingLogin,
    required TResult Function(_successLogin value) successLogin,
    required TResult Function(errorLogin value) errorLogin,
    required TResult Function(_loadingLoginWithToken value)
        loadingLoginWithToken,
    required TResult Function(_successLoginWithToken value) getHomeDataSucceed,
    required TResult Function(_errorLoginWithToken value) getHomeDataError,
  }) {
    return errorLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loadingLogin value)? loadingLogin,
    TResult? Function(_successLogin value)? successLogin,
    TResult? Function(errorLogin value)? errorLogin,
    TResult? Function(_loadingLoginWithToken value)? loadingLoginWithToken,
    TResult? Function(_successLoginWithToken value)? getHomeDataSucceed,
    TResult? Function(_errorLoginWithToken value)? getHomeDataError,
  }) {
    return errorLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loadingLogin value)? loadingLogin,
    TResult Function(_successLogin value)? successLogin,
    TResult Function(errorLogin value)? errorLogin,
    TResult Function(_loadingLoginWithToken value)? loadingLoginWithToken,
    TResult Function(_successLoginWithToken value)? getHomeDataSucceed,
    TResult Function(_errorLoginWithToken value)? getHomeDataError,
    required TResult orElse(),
  }) {
    if (errorLogin != null) {
      return errorLogin(this);
    }
    return orElse();
  }
}

abstract class errorLogin implements AuthState {
  const factory errorLogin(final String err) = _$errorLoginImpl;

  String get err;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$errorLoginImplCopyWith<_$errorLoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$loadingLoginWithTokenImplCopyWith<$Res> {
  factory _$$loadingLoginWithTokenImplCopyWith(
          _$loadingLoginWithTokenImpl value,
          $Res Function(_$loadingLoginWithTokenImpl) then) =
      __$$loadingLoginWithTokenImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$loadingLoginWithTokenImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$loadingLoginWithTokenImpl>
    implements _$$loadingLoginWithTokenImplCopyWith<$Res> {
  __$$loadingLoginWithTokenImplCopyWithImpl(_$loadingLoginWithTokenImpl _value,
      $Res Function(_$loadingLoginWithTokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$loadingLoginWithTokenImpl implements _loadingLoginWithToken {
  const _$loadingLoginWithTokenImpl();

  @override
  String toString() {
    return 'AuthState.loadingLoginWithToken()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$loadingLoginWithTokenImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingLogin,
    required TResult Function(LoginResponse response) successLogin,
    required TResult Function(String err) errorLogin,
    required TResult Function() loadingLoginWithToken,
    required TResult Function(User user) getHomeDataSucceed,
    required TResult Function(String err) getHomeDataError,
  }) {
    return loadingLoginWithToken();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingLogin,
    TResult? Function(LoginResponse response)? successLogin,
    TResult? Function(String err)? errorLogin,
    TResult? Function()? loadingLoginWithToken,
    TResult? Function(User user)? getHomeDataSucceed,
    TResult? Function(String err)? getHomeDataError,
  }) {
    return loadingLoginWithToken?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingLogin,
    TResult Function(LoginResponse response)? successLogin,
    TResult Function(String err)? errorLogin,
    TResult Function()? loadingLoginWithToken,
    TResult Function(User user)? getHomeDataSucceed,
    TResult Function(String err)? getHomeDataError,
    required TResult orElse(),
  }) {
    if (loadingLoginWithToken != null) {
      return loadingLoginWithToken();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loadingLogin value) loadingLogin,
    required TResult Function(_successLogin value) successLogin,
    required TResult Function(errorLogin value) errorLogin,
    required TResult Function(_loadingLoginWithToken value)
        loadingLoginWithToken,
    required TResult Function(_successLoginWithToken value) getHomeDataSucceed,
    required TResult Function(_errorLoginWithToken value) getHomeDataError,
  }) {
    return loadingLoginWithToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loadingLogin value)? loadingLogin,
    TResult? Function(_successLogin value)? successLogin,
    TResult? Function(errorLogin value)? errorLogin,
    TResult? Function(_loadingLoginWithToken value)? loadingLoginWithToken,
    TResult? Function(_successLoginWithToken value)? getHomeDataSucceed,
    TResult? Function(_errorLoginWithToken value)? getHomeDataError,
  }) {
    return loadingLoginWithToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loadingLogin value)? loadingLogin,
    TResult Function(_successLogin value)? successLogin,
    TResult Function(errorLogin value)? errorLogin,
    TResult Function(_loadingLoginWithToken value)? loadingLoginWithToken,
    TResult Function(_successLoginWithToken value)? getHomeDataSucceed,
    TResult Function(_errorLoginWithToken value)? getHomeDataError,
    required TResult orElse(),
  }) {
    if (loadingLoginWithToken != null) {
      return loadingLoginWithToken(this);
    }
    return orElse();
  }
}

abstract class _loadingLoginWithToken implements AuthState {
  const factory _loadingLoginWithToken() = _$loadingLoginWithTokenImpl;
}

/// @nodoc
abstract class _$$successLoginWithTokenImplCopyWith<$Res> {
  factory _$$successLoginWithTokenImplCopyWith(
          _$successLoginWithTokenImpl value,
          $Res Function(_$successLoginWithTokenImpl) then) =
      __$$successLoginWithTokenImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});
}

/// @nodoc
class __$$successLoginWithTokenImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$successLoginWithTokenImpl>
    implements _$$successLoginWithTokenImplCopyWith<$Res> {
  __$$successLoginWithTokenImplCopyWithImpl(_$successLoginWithTokenImpl _value,
      $Res Function(_$successLoginWithTokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$successLoginWithTokenImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$successLoginWithTokenImpl implements _successLoginWithToken {
  const _$successLoginWithTokenImpl(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'AuthState.getHomeDataSucceed(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$successLoginWithTokenImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$successLoginWithTokenImplCopyWith<_$successLoginWithTokenImpl>
      get copyWith => __$$successLoginWithTokenImplCopyWithImpl<
          _$successLoginWithTokenImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingLogin,
    required TResult Function(LoginResponse response) successLogin,
    required TResult Function(String err) errorLogin,
    required TResult Function() loadingLoginWithToken,
    required TResult Function(User user) getHomeDataSucceed,
    required TResult Function(String err) getHomeDataError,
  }) {
    return getHomeDataSucceed(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingLogin,
    TResult? Function(LoginResponse response)? successLogin,
    TResult? Function(String err)? errorLogin,
    TResult? Function()? loadingLoginWithToken,
    TResult? Function(User user)? getHomeDataSucceed,
    TResult? Function(String err)? getHomeDataError,
  }) {
    return getHomeDataSucceed?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingLogin,
    TResult Function(LoginResponse response)? successLogin,
    TResult Function(String err)? errorLogin,
    TResult Function()? loadingLoginWithToken,
    TResult Function(User user)? getHomeDataSucceed,
    TResult Function(String err)? getHomeDataError,
    required TResult orElse(),
  }) {
    if (getHomeDataSucceed != null) {
      return getHomeDataSucceed(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loadingLogin value) loadingLogin,
    required TResult Function(_successLogin value) successLogin,
    required TResult Function(errorLogin value) errorLogin,
    required TResult Function(_loadingLoginWithToken value)
        loadingLoginWithToken,
    required TResult Function(_successLoginWithToken value) getHomeDataSucceed,
    required TResult Function(_errorLoginWithToken value) getHomeDataError,
  }) {
    return getHomeDataSucceed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loadingLogin value)? loadingLogin,
    TResult? Function(_successLogin value)? successLogin,
    TResult? Function(errorLogin value)? errorLogin,
    TResult? Function(_loadingLoginWithToken value)? loadingLoginWithToken,
    TResult? Function(_successLoginWithToken value)? getHomeDataSucceed,
    TResult? Function(_errorLoginWithToken value)? getHomeDataError,
  }) {
    return getHomeDataSucceed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loadingLogin value)? loadingLogin,
    TResult Function(_successLogin value)? successLogin,
    TResult Function(errorLogin value)? errorLogin,
    TResult Function(_loadingLoginWithToken value)? loadingLoginWithToken,
    TResult Function(_successLoginWithToken value)? getHomeDataSucceed,
    TResult Function(_errorLoginWithToken value)? getHomeDataError,
    required TResult orElse(),
  }) {
    if (getHomeDataSucceed != null) {
      return getHomeDataSucceed(this);
    }
    return orElse();
  }
}

abstract class _successLoginWithToken implements AuthState {
  const factory _successLoginWithToken(final User user) =
      _$successLoginWithTokenImpl;

  User get user;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$successLoginWithTokenImplCopyWith<_$successLoginWithTokenImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$errorLoginWithTokenImplCopyWith<$Res> {
  factory _$$errorLoginWithTokenImplCopyWith(_$errorLoginWithTokenImpl value,
          $Res Function(_$errorLoginWithTokenImpl) then) =
      __$$errorLoginWithTokenImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String err});
}

/// @nodoc
class __$$errorLoginWithTokenImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$errorLoginWithTokenImpl>
    implements _$$errorLoginWithTokenImplCopyWith<$Res> {
  __$$errorLoginWithTokenImplCopyWithImpl(_$errorLoginWithTokenImpl _value,
      $Res Function(_$errorLoginWithTokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$errorLoginWithTokenImpl(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$errorLoginWithTokenImpl implements _errorLoginWithToken {
  const _$errorLoginWithTokenImpl(this.err);

  @override
  final String err;

  @override
  String toString() {
    return 'AuthState.getHomeDataError(err: $err)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$errorLoginWithTokenImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$errorLoginWithTokenImplCopyWith<_$errorLoginWithTokenImpl> get copyWith =>
      __$$errorLoginWithTokenImplCopyWithImpl<_$errorLoginWithTokenImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingLogin,
    required TResult Function(LoginResponse response) successLogin,
    required TResult Function(String err) errorLogin,
    required TResult Function() loadingLoginWithToken,
    required TResult Function(User user) getHomeDataSucceed,
    required TResult Function(String err) getHomeDataError,
  }) {
    return getHomeDataError(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingLogin,
    TResult? Function(LoginResponse response)? successLogin,
    TResult? Function(String err)? errorLogin,
    TResult? Function()? loadingLoginWithToken,
    TResult? Function(User user)? getHomeDataSucceed,
    TResult? Function(String err)? getHomeDataError,
  }) {
    return getHomeDataError?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingLogin,
    TResult Function(LoginResponse response)? successLogin,
    TResult Function(String err)? errorLogin,
    TResult Function()? loadingLoginWithToken,
    TResult Function(User user)? getHomeDataSucceed,
    TResult Function(String err)? getHomeDataError,
    required TResult orElse(),
  }) {
    if (getHomeDataError != null) {
      return getHomeDataError(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loadingLogin value) loadingLogin,
    required TResult Function(_successLogin value) successLogin,
    required TResult Function(errorLogin value) errorLogin,
    required TResult Function(_loadingLoginWithToken value)
        loadingLoginWithToken,
    required TResult Function(_successLoginWithToken value) getHomeDataSucceed,
    required TResult Function(_errorLoginWithToken value) getHomeDataError,
  }) {
    return getHomeDataError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loadingLogin value)? loadingLogin,
    TResult? Function(_successLogin value)? successLogin,
    TResult? Function(errorLogin value)? errorLogin,
    TResult? Function(_loadingLoginWithToken value)? loadingLoginWithToken,
    TResult? Function(_successLoginWithToken value)? getHomeDataSucceed,
    TResult? Function(_errorLoginWithToken value)? getHomeDataError,
  }) {
    return getHomeDataError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loadingLogin value)? loadingLogin,
    TResult Function(_successLogin value)? successLogin,
    TResult Function(errorLogin value)? errorLogin,
    TResult Function(_loadingLoginWithToken value)? loadingLoginWithToken,
    TResult Function(_successLoginWithToken value)? getHomeDataSucceed,
    TResult Function(_errorLoginWithToken value)? getHomeDataError,
    required TResult orElse(),
  }) {
    if (getHomeDataError != null) {
      return getHomeDataError(this);
    }
    return orElse();
  }
}

abstract class _errorLoginWithToken implements AuthState {
  const factory _errorLoginWithToken(final String err) =
      _$errorLoginWithTokenImpl;

  String get err;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$errorLoginWithTokenImplCopyWith<_$errorLoginWithTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
