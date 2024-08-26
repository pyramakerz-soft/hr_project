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
  LoginRequest get request => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginRequest request) login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginRequest request)? login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginRequest request)? login,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_login value) login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_login value)? login,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_login value)? login,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthEventCopyWith<AuthEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
  @useResult
  $Res call({LoginRequest request});
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
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_value.copyWith(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as LoginRequest,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$loginImplCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$$loginImplCopyWith(
          _$loginImpl value, $Res Function(_$loginImpl) then) =
      __$$loginImplCopyWithImpl<$Res>;
  @override
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
  }) {
    return login(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginRequest request)? login,
  }) {
    return login?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginRequest request)? login,
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
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_login value)? login,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_login value)? login,
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

  @override
  LoginRequest get request;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$loginImplCopyWith<_$loginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadinglogin,
    required TResult Function(LoginResponse response) successlogin,
    required TResult Function(String err) errorlogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadinglogin,
    TResult? Function(LoginResponse response)? successlogin,
    TResult? Function(String err)? errorlogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadinglogin,
    TResult Function(LoginResponse response)? successlogin,
    TResult Function(String err)? errorlogin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loadinglogin value) loadinglogin,
    required TResult Function(_successlogin value) successlogin,
    required TResult Function(errorlogin value) errorlogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loadinglogin value)? loadinglogin,
    TResult? Function(_successlogin value)? successlogin,
    TResult? Function(errorlogin value)? errorlogin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loadinglogin value)? loadinglogin,
    TResult Function(_successlogin value)? successlogin,
    TResult Function(errorlogin value)? errorlogin,
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
    required TResult Function() loadinglogin,
    required TResult Function(LoginResponse response) successlogin,
    required TResult Function(String err) errorlogin,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadinglogin,
    TResult? Function(LoginResponse response)? successlogin,
    TResult? Function(String err)? errorlogin,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadinglogin,
    TResult Function(LoginResponse response)? successlogin,
    TResult Function(String err)? errorlogin,
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
    required TResult Function(_loadinglogin value) loadinglogin,
    required TResult Function(_successlogin value) successlogin,
    required TResult Function(errorlogin value) errorlogin,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loadinglogin value)? loadinglogin,
    TResult? Function(_successlogin value)? successlogin,
    TResult? Function(errorlogin value)? errorlogin,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loadinglogin value)? loadinglogin,
    TResult Function(_successlogin value)? successlogin,
    TResult Function(errorlogin value)? errorlogin,
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
abstract class _$$loadingloginImplCopyWith<$Res> {
  factory _$$loadingloginImplCopyWith(
          _$loadingloginImpl value, $Res Function(_$loadingloginImpl) then) =
      __$$loadingloginImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$loadingloginImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$loadingloginImpl>
    implements _$$loadingloginImplCopyWith<$Res> {
  __$$loadingloginImplCopyWithImpl(
      _$loadingloginImpl _value, $Res Function(_$loadingloginImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$loadingloginImpl implements _loadinglogin {
  const _$loadingloginImpl();

  @override
  String toString() {
    return 'AuthState.loadinglogin()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$loadingloginImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadinglogin,
    required TResult Function(LoginResponse response) successlogin,
    required TResult Function(String err) errorlogin,
  }) {
    return loadinglogin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadinglogin,
    TResult? Function(LoginResponse response)? successlogin,
    TResult? Function(String err)? errorlogin,
  }) {
    return loadinglogin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadinglogin,
    TResult Function(LoginResponse response)? successlogin,
    TResult Function(String err)? errorlogin,
    required TResult orElse(),
  }) {
    if (loadinglogin != null) {
      return loadinglogin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loadinglogin value) loadinglogin,
    required TResult Function(_successlogin value) successlogin,
    required TResult Function(errorlogin value) errorlogin,
  }) {
    return loadinglogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loadinglogin value)? loadinglogin,
    TResult? Function(_successlogin value)? successlogin,
    TResult? Function(errorlogin value)? errorlogin,
  }) {
    return loadinglogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loadinglogin value)? loadinglogin,
    TResult Function(_successlogin value)? successlogin,
    TResult Function(errorlogin value)? errorlogin,
    required TResult orElse(),
  }) {
    if (loadinglogin != null) {
      return loadinglogin(this);
    }
    return orElse();
  }
}

abstract class _loadinglogin implements AuthState {
  const factory _loadinglogin() = _$loadingloginImpl;
}

/// @nodoc
abstract class _$$successloginImplCopyWith<$Res> {
  factory _$$successloginImplCopyWith(
          _$successloginImpl value, $Res Function(_$successloginImpl) then) =
      __$$successloginImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LoginResponse response});
}

/// @nodoc
class __$$successloginImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$successloginImpl>
    implements _$$successloginImplCopyWith<$Res> {
  __$$successloginImplCopyWithImpl(
      _$successloginImpl _value, $Res Function(_$successloginImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$successloginImpl(
      null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as LoginResponse,
    ));
  }
}

/// @nodoc

class _$successloginImpl implements _successlogin {
  const _$successloginImpl(this.response);

  @override
  final LoginResponse response;

  @override
  String toString() {
    return 'AuthState.successlogin(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$successloginImpl &&
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
  _$$successloginImplCopyWith<_$successloginImpl> get copyWith =>
      __$$successloginImplCopyWithImpl<_$successloginImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadinglogin,
    required TResult Function(LoginResponse response) successlogin,
    required TResult Function(String err) errorlogin,
  }) {
    return successlogin(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadinglogin,
    TResult? Function(LoginResponse response)? successlogin,
    TResult? Function(String err)? errorlogin,
  }) {
    return successlogin?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadinglogin,
    TResult Function(LoginResponse response)? successlogin,
    TResult Function(String err)? errorlogin,
    required TResult orElse(),
  }) {
    if (successlogin != null) {
      return successlogin(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loadinglogin value) loadinglogin,
    required TResult Function(_successlogin value) successlogin,
    required TResult Function(errorlogin value) errorlogin,
  }) {
    return successlogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loadinglogin value)? loadinglogin,
    TResult? Function(_successlogin value)? successlogin,
    TResult? Function(errorlogin value)? errorlogin,
  }) {
    return successlogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loadinglogin value)? loadinglogin,
    TResult Function(_successlogin value)? successlogin,
    TResult Function(errorlogin value)? errorlogin,
    required TResult orElse(),
  }) {
    if (successlogin != null) {
      return successlogin(this);
    }
    return orElse();
  }
}

abstract class _successlogin implements AuthState {
  const factory _successlogin(final LoginResponse response) =
      _$successloginImpl;

  LoginResponse get response;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$successloginImplCopyWith<_$successloginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$errorloginImplCopyWith<$Res> {
  factory _$$errorloginImplCopyWith(
          _$errorloginImpl value, $Res Function(_$errorloginImpl) then) =
      __$$errorloginImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String err});
}

/// @nodoc
class __$$errorloginImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$errorloginImpl>
    implements _$$errorloginImplCopyWith<$Res> {
  __$$errorloginImplCopyWithImpl(
      _$errorloginImpl _value, $Res Function(_$errorloginImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$errorloginImpl(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$errorloginImpl implements errorlogin {
  const _$errorloginImpl(this.err);

  @override
  final String err;

  @override
  String toString() {
    return 'AuthState.errorlogin(err: $err)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$errorloginImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$errorloginImplCopyWith<_$errorloginImpl> get copyWith =>
      __$$errorloginImplCopyWithImpl<_$errorloginImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadinglogin,
    required TResult Function(LoginResponse response) successlogin,
    required TResult Function(String err) errorlogin,
  }) {
    return errorlogin(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadinglogin,
    TResult? Function(LoginResponse response)? successlogin,
    TResult? Function(String err)? errorlogin,
  }) {
    return errorlogin?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadinglogin,
    TResult Function(LoginResponse response)? successlogin,
    TResult Function(String err)? errorlogin,
    required TResult orElse(),
  }) {
    if (errorlogin != null) {
      return errorlogin(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loadinglogin value) loadinglogin,
    required TResult Function(_successlogin value) successlogin,
    required TResult Function(errorlogin value) errorlogin,
  }) {
    return errorlogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loadinglogin value)? loadinglogin,
    TResult? Function(_successlogin value)? successlogin,
    TResult? Function(errorlogin value)? errorlogin,
  }) {
    return errorlogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loadinglogin value)? loadinglogin,
    TResult Function(_successlogin value)? successlogin,
    TResult Function(errorlogin value)? errorlogin,
    required TResult orElse(),
  }) {
    if (errorlogin != null) {
      return errorlogin(this);
    }
    return orElse();
  }
}

abstract class errorlogin implements AuthState {
  const factory errorlogin(final String err) = _$errorloginImpl;

  String get err;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$errorloginImplCopyWith<_$errorloginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
