// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clock_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ClockEvent {
  ClockRequest get request => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ClockRequest request) clockIn,
    required TResult Function(ClockRequest request) clockOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ClockRequest request)? clockIn,
    TResult? Function(ClockRequest request)? clockOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ClockRequest request)? clockIn,
    TResult Function(ClockRequest request)? clockOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_clockIn value) clockIn,
    required TResult Function(_clockOut value) clockOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_clockIn value)? clockIn,
    TResult? Function(_clockOut value)? clockOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_clockIn value)? clockIn,
    TResult Function(_clockOut value)? clockOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ClockEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClockEventCopyWith<ClockEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClockEventCopyWith<$Res> {
  factory $ClockEventCopyWith(
          ClockEvent value, $Res Function(ClockEvent) then) =
      _$ClockEventCopyWithImpl<$Res, ClockEvent>;
  @useResult
  $Res call({ClockRequest request});
}

/// @nodoc
class _$ClockEventCopyWithImpl<$Res, $Val extends ClockEvent>
    implements $ClockEventCopyWith<$Res> {
  _$ClockEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClockEvent
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
              as ClockRequest,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$clockInImplCopyWith<$Res>
    implements $ClockEventCopyWith<$Res> {
  factory _$$clockInImplCopyWith(
          _$clockInImpl value, $Res Function(_$clockInImpl) then) =
      __$$clockInImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ClockRequest request});
}

/// @nodoc
class __$$clockInImplCopyWithImpl<$Res>
    extends _$ClockEventCopyWithImpl<$Res, _$clockInImpl>
    implements _$$clockInImplCopyWith<$Res> {
  __$$clockInImplCopyWithImpl(
      _$clockInImpl _value, $Res Function(_$clockInImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClockEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$clockInImpl(
      null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as ClockRequest,
    ));
  }
}

/// @nodoc

class _$clockInImpl implements _clockIn {
  const _$clockInImpl(this.request);

  @override
  final ClockRequest request;

  @override
  String toString() {
    return 'ClockEvent.clockIn(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$clockInImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of ClockEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$clockInImplCopyWith<_$clockInImpl> get copyWith =>
      __$$clockInImplCopyWithImpl<_$clockInImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ClockRequest request) clockIn,
    required TResult Function(ClockRequest request) clockOut,
  }) {
    return clockIn(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ClockRequest request)? clockIn,
    TResult? Function(ClockRequest request)? clockOut,
  }) {
    return clockIn?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ClockRequest request)? clockIn,
    TResult Function(ClockRequest request)? clockOut,
    required TResult orElse(),
  }) {
    if (clockIn != null) {
      return clockIn(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_clockIn value) clockIn,
    required TResult Function(_clockOut value) clockOut,
  }) {
    return clockIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_clockIn value)? clockIn,
    TResult? Function(_clockOut value)? clockOut,
  }) {
    return clockIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_clockIn value)? clockIn,
    TResult Function(_clockOut value)? clockOut,
    required TResult orElse(),
  }) {
    if (clockIn != null) {
      return clockIn(this);
    }
    return orElse();
  }
}

abstract class _clockIn implements ClockEvent {
  const factory _clockIn(final ClockRequest request) = _$clockInImpl;

  @override
  ClockRequest get request;

  /// Create a copy of ClockEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$clockInImplCopyWith<_$clockInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$clockOutImplCopyWith<$Res>
    implements $ClockEventCopyWith<$Res> {
  factory _$$clockOutImplCopyWith(
          _$clockOutImpl value, $Res Function(_$clockOutImpl) then) =
      __$$clockOutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ClockRequest request});
}

/// @nodoc
class __$$clockOutImplCopyWithImpl<$Res>
    extends _$ClockEventCopyWithImpl<$Res, _$clockOutImpl>
    implements _$$clockOutImplCopyWith<$Res> {
  __$$clockOutImplCopyWithImpl(
      _$clockOutImpl _value, $Res Function(_$clockOutImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClockEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$clockOutImpl(
      null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as ClockRequest,
    ));
  }
}

/// @nodoc

class _$clockOutImpl implements _clockOut {
  const _$clockOutImpl(this.request);

  @override
  final ClockRequest request;

  @override
  String toString() {
    return 'ClockEvent.clockOut(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$clockOutImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of ClockEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$clockOutImplCopyWith<_$clockOutImpl> get copyWith =>
      __$$clockOutImplCopyWithImpl<_$clockOutImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ClockRequest request) clockIn,
    required TResult Function(ClockRequest request) clockOut,
  }) {
    return clockOut(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ClockRequest request)? clockIn,
    TResult? Function(ClockRequest request)? clockOut,
  }) {
    return clockOut?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ClockRequest request)? clockIn,
    TResult Function(ClockRequest request)? clockOut,
    required TResult orElse(),
  }) {
    if (clockOut != null) {
      return clockOut(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_clockIn value) clockIn,
    required TResult Function(_clockOut value) clockOut,
  }) {
    return clockOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_clockIn value)? clockIn,
    TResult? Function(_clockOut value)? clockOut,
  }) {
    return clockOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_clockIn value)? clockIn,
    TResult Function(_clockOut value)? clockOut,
    required TResult orElse(),
  }) {
    if (clockOut != null) {
      return clockOut(this);
    }
    return orElse();
  }
}

abstract class _clockOut implements ClockEvent {
  const factory _clockOut(final ClockRequest request) = _$clockOutImpl;

  @override
  ClockRequest get request;

  /// Create a copy of ClockEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$clockOutImplCopyWith<_$clockOutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ClockState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingClocking,
    required TResult Function(String err) errorClocking,
    required TResult Function(ClockResponse resp) successClocking,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingClocking,
    TResult? Function(String err)? errorClocking,
    TResult? Function(ClockResponse resp)? successClocking,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingClocking,
    TResult Function(String err)? errorClocking,
    TResult Function(ClockResponse resp)? successClocking,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loadingClocking value) loadingClocking,
    required TResult Function(_errorClocking value) errorClocking,
    required TResult Function(_successClocking value) successClocking,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loadingClocking value)? loadingClocking,
    TResult? Function(_errorClocking value)? errorClocking,
    TResult? Function(_successClocking value)? successClocking,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loadingClocking value)? loadingClocking,
    TResult Function(_errorClocking value)? errorClocking,
    TResult Function(_successClocking value)? successClocking,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClockStateCopyWith<$Res> {
  factory $ClockStateCopyWith(
          ClockState value, $Res Function(ClockState) then) =
      _$ClockStateCopyWithImpl<$Res, ClockState>;
}

/// @nodoc
class _$ClockStateCopyWithImpl<$Res, $Val extends ClockState>
    implements $ClockStateCopyWith<$Res> {
  _$ClockStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClockState
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
    extends _$ClockStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClockState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ClockState.initial()';
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
    required TResult Function() loadingClocking,
    required TResult Function(String err) errorClocking,
    required TResult Function(ClockResponse resp) successClocking,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingClocking,
    TResult? Function(String err)? errorClocking,
    TResult? Function(ClockResponse resp)? successClocking,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingClocking,
    TResult Function(String err)? errorClocking,
    TResult Function(ClockResponse resp)? successClocking,
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
    required TResult Function(_loadingClocking value) loadingClocking,
    required TResult Function(_errorClocking value) errorClocking,
    required TResult Function(_successClocking value) successClocking,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loadingClocking value)? loadingClocking,
    TResult? Function(_errorClocking value)? errorClocking,
    TResult? Function(_successClocking value)? successClocking,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loadingClocking value)? loadingClocking,
    TResult Function(_errorClocking value)? errorClocking,
    TResult Function(_successClocking value)? successClocking,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ClockState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$loadingClockingImplCopyWith<$Res> {
  factory _$$loadingClockingImplCopyWith(_$loadingClockingImpl value,
          $Res Function(_$loadingClockingImpl) then) =
      __$$loadingClockingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$loadingClockingImplCopyWithImpl<$Res>
    extends _$ClockStateCopyWithImpl<$Res, _$loadingClockingImpl>
    implements _$$loadingClockingImplCopyWith<$Res> {
  __$$loadingClockingImplCopyWithImpl(
      _$loadingClockingImpl _value, $Res Function(_$loadingClockingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClockState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$loadingClockingImpl implements _loadingClocking {
  const _$loadingClockingImpl();

  @override
  String toString() {
    return 'ClockState.loadingClocking()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$loadingClockingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingClocking,
    required TResult Function(String err) errorClocking,
    required TResult Function(ClockResponse resp) successClocking,
  }) {
    return loadingClocking();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingClocking,
    TResult? Function(String err)? errorClocking,
    TResult? Function(ClockResponse resp)? successClocking,
  }) {
    return loadingClocking?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingClocking,
    TResult Function(String err)? errorClocking,
    TResult Function(ClockResponse resp)? successClocking,
    required TResult orElse(),
  }) {
    if (loadingClocking != null) {
      return loadingClocking();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loadingClocking value) loadingClocking,
    required TResult Function(_errorClocking value) errorClocking,
    required TResult Function(_successClocking value) successClocking,
  }) {
    return loadingClocking(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loadingClocking value)? loadingClocking,
    TResult? Function(_errorClocking value)? errorClocking,
    TResult? Function(_successClocking value)? successClocking,
  }) {
    return loadingClocking?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loadingClocking value)? loadingClocking,
    TResult Function(_errorClocking value)? errorClocking,
    TResult Function(_successClocking value)? successClocking,
    required TResult orElse(),
  }) {
    if (loadingClocking != null) {
      return loadingClocking(this);
    }
    return orElse();
  }
}

abstract class _loadingClocking implements ClockState {
  const factory _loadingClocking() = _$loadingClockingImpl;
}

/// @nodoc
abstract class _$$errorClockingImplCopyWith<$Res> {
  factory _$$errorClockingImplCopyWith(
          _$errorClockingImpl value, $Res Function(_$errorClockingImpl) then) =
      __$$errorClockingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String err});
}

/// @nodoc
class __$$errorClockingImplCopyWithImpl<$Res>
    extends _$ClockStateCopyWithImpl<$Res, _$errorClockingImpl>
    implements _$$errorClockingImplCopyWith<$Res> {
  __$$errorClockingImplCopyWithImpl(
      _$errorClockingImpl _value, $Res Function(_$errorClockingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClockState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$errorClockingImpl(
      null == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$errorClockingImpl implements _errorClocking {
  const _$errorClockingImpl(this.err);

  @override
  final String err;

  @override
  String toString() {
    return 'ClockState.errorClocking(err: $err)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$errorClockingImpl &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, err);

  /// Create a copy of ClockState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$errorClockingImplCopyWith<_$errorClockingImpl> get copyWith =>
      __$$errorClockingImplCopyWithImpl<_$errorClockingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingClocking,
    required TResult Function(String err) errorClocking,
    required TResult Function(ClockResponse resp) successClocking,
  }) {
    return errorClocking(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingClocking,
    TResult? Function(String err)? errorClocking,
    TResult? Function(ClockResponse resp)? successClocking,
  }) {
    return errorClocking?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingClocking,
    TResult Function(String err)? errorClocking,
    TResult Function(ClockResponse resp)? successClocking,
    required TResult orElse(),
  }) {
    if (errorClocking != null) {
      return errorClocking(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loadingClocking value) loadingClocking,
    required TResult Function(_errorClocking value) errorClocking,
    required TResult Function(_successClocking value) successClocking,
  }) {
    return errorClocking(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loadingClocking value)? loadingClocking,
    TResult? Function(_errorClocking value)? errorClocking,
    TResult? Function(_successClocking value)? successClocking,
  }) {
    return errorClocking?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loadingClocking value)? loadingClocking,
    TResult Function(_errorClocking value)? errorClocking,
    TResult Function(_successClocking value)? successClocking,
    required TResult orElse(),
  }) {
    if (errorClocking != null) {
      return errorClocking(this);
    }
    return orElse();
  }
}

abstract class _errorClocking implements ClockState {
  const factory _errorClocking(final String err) = _$errorClockingImpl;

  String get err;

  /// Create a copy of ClockState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$errorClockingImplCopyWith<_$errorClockingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$successClockingImplCopyWith<$Res> {
  factory _$$successClockingImplCopyWith(_$successClockingImpl value,
          $Res Function(_$successClockingImpl) then) =
      __$$successClockingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ClockResponse resp});
}

/// @nodoc
class __$$successClockingImplCopyWithImpl<$Res>
    extends _$ClockStateCopyWithImpl<$Res, _$successClockingImpl>
    implements _$$successClockingImplCopyWith<$Res> {
  __$$successClockingImplCopyWithImpl(
      _$successClockingImpl _value, $Res Function(_$successClockingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClockState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resp = null,
  }) {
    return _then(_$successClockingImpl(
      null == resp
          ? _value.resp
          : resp // ignore: cast_nullable_to_non_nullable
              as ClockResponse,
    ));
  }
}

/// @nodoc

class _$successClockingImpl implements _successClocking {
  const _$successClockingImpl(this.resp);

  @override
  final ClockResponse resp;

  @override
  String toString() {
    return 'ClockState.successClocking(resp: $resp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$successClockingImpl &&
            (identical(other.resp, resp) || other.resp == resp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, resp);

  /// Create a copy of ClockState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$successClockingImplCopyWith<_$successClockingImpl> get copyWith =>
      __$$successClockingImplCopyWithImpl<_$successClockingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingClocking,
    required TResult Function(String err) errorClocking,
    required TResult Function(ClockResponse resp) successClocking,
  }) {
    return successClocking(resp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingClocking,
    TResult? Function(String err)? errorClocking,
    TResult? Function(ClockResponse resp)? successClocking,
  }) {
    return successClocking?.call(resp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingClocking,
    TResult Function(String err)? errorClocking,
    TResult Function(ClockResponse resp)? successClocking,
    required TResult orElse(),
  }) {
    if (successClocking != null) {
      return successClocking(resp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_loadingClocking value) loadingClocking,
    required TResult Function(_errorClocking value) errorClocking,
    required TResult Function(_successClocking value) successClocking,
  }) {
    return successClocking(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_loadingClocking value)? loadingClocking,
    TResult? Function(_errorClocking value)? errorClocking,
    TResult? Function(_successClocking value)? successClocking,
  }) {
    return successClocking?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_loadingClocking value)? loadingClocking,
    TResult Function(_errorClocking value)? errorClocking,
    TResult Function(_successClocking value)? successClocking,
    required TResult orElse(),
  }) {
    if (successClocking != null) {
      return successClocking(this);
    }
    return orElse();
  }
}

abstract class _successClocking implements ClockState {
  const factory _successClocking(final ClockResponse resp) =
      _$successClockingImpl;

  ClockResponse get resp;

  /// Create a copy of ClockState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$successClockingImplCopyWith<_$successClockingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
