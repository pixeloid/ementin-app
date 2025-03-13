// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_exceptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NetworkExceptions {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NetworkExceptions);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NetworkExceptions()';
  }
}

/// @nodoc
class $NetworkExceptionsCopyWith<$Res> {
  $NetworkExceptionsCopyWith(
      NetworkExceptions _, $Res Function(NetworkExceptions) __);
}

/// @nodoc

class RequestCancelled implements NetworkExceptions {
  const RequestCancelled();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RequestCancelled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NetworkExceptions.requestCancelled()';
  }
}

/// @nodoc

class UnauthorizedRequest implements NetworkExceptions {
  const UnauthorizedRequest(this.reason);

  final String reason;

  /// Create a copy of NetworkExceptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UnauthorizedRequestCopyWith<UnauthorizedRequest> get copyWith =>
      _$UnauthorizedRequestCopyWithImpl<UnauthorizedRequest>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnauthorizedRequest &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason);

  @override
  String toString() {
    return 'NetworkExceptions.unauthorizedRequest(reason: $reason)';
  }
}

/// @nodoc
abstract mixin class $UnauthorizedRequestCopyWith<$Res>
    implements $NetworkExceptionsCopyWith<$Res> {
  factory $UnauthorizedRequestCopyWith(
          UnauthorizedRequest value, $Res Function(UnauthorizedRequest) _then) =
      _$UnauthorizedRequestCopyWithImpl;
  @useResult
  $Res call({String reason});
}

/// @nodoc
class _$UnauthorizedRequestCopyWithImpl<$Res>
    implements $UnauthorizedRequestCopyWith<$Res> {
  _$UnauthorizedRequestCopyWithImpl(this._self, this._then);

  final UnauthorizedRequest _self;
  final $Res Function(UnauthorizedRequest) _then;

  /// Create a copy of NetworkExceptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reason = null,
  }) {
    return _then(UnauthorizedRequest(
      null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class BadRequest implements NetworkExceptions {
  const BadRequest();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BadRequest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NetworkExceptions.badRequest()';
  }
}

/// @nodoc

class NotFound implements NetworkExceptions {
  const NotFound(this.reason);

  final String reason;

  /// Create a copy of NetworkExceptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotFoundCopyWith<NotFound> get copyWith =>
      _$NotFoundCopyWithImpl<NotFound>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotFound &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason);

  @override
  String toString() {
    return 'NetworkExceptions.notFound(reason: $reason)';
  }
}

/// @nodoc
abstract mixin class $NotFoundCopyWith<$Res>
    implements $NetworkExceptionsCopyWith<$Res> {
  factory $NotFoundCopyWith(NotFound value, $Res Function(NotFound) _then) =
      _$NotFoundCopyWithImpl;
  @useResult
  $Res call({String reason});
}

/// @nodoc
class _$NotFoundCopyWithImpl<$Res> implements $NotFoundCopyWith<$Res> {
  _$NotFoundCopyWithImpl(this._self, this._then);

  final NotFound _self;
  final $Res Function(NotFound) _then;

  /// Create a copy of NetworkExceptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reason = null,
  }) {
    return _then(NotFound(
      null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class MethodNotAllowed implements NetworkExceptions {
  const MethodNotAllowed();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MethodNotAllowed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NetworkExceptions.methodNotAllowed()';
  }
}

/// @nodoc

class NotAcceptable implements NetworkExceptions {
  const NotAcceptable();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NotAcceptable);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NetworkExceptions.notAcceptable()';
  }
}

/// @nodoc

class RequestTimeout implements NetworkExceptions {
  const RequestTimeout();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RequestTimeout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NetworkExceptions.requestTimeout()';
  }
}

/// @nodoc

class SendTimeout implements NetworkExceptions {
  const SendTimeout();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SendTimeout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NetworkExceptions.sendTimeout()';
  }
}

/// @nodoc

class Conflict implements NetworkExceptions {
  const Conflict();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Conflict);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NetworkExceptions.conflict()';
  }
}

/// @nodoc

class InternalServerError implements NetworkExceptions {
  const InternalServerError(this.reason);

  final String reason;

  /// Create a copy of NetworkExceptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InternalServerErrorCopyWith<InternalServerError> get copyWith =>
      _$InternalServerErrorCopyWithImpl<InternalServerError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InternalServerError &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reason);

  @override
  String toString() {
    return 'NetworkExceptions.internalServerError(reason: $reason)';
  }
}

/// @nodoc
abstract mixin class $InternalServerErrorCopyWith<$Res>
    implements $NetworkExceptionsCopyWith<$Res> {
  factory $InternalServerErrorCopyWith(
          InternalServerError value, $Res Function(InternalServerError) _then) =
      _$InternalServerErrorCopyWithImpl;
  @useResult
  $Res call({String reason});
}

/// @nodoc
class _$InternalServerErrorCopyWithImpl<$Res>
    implements $InternalServerErrorCopyWith<$Res> {
  _$InternalServerErrorCopyWithImpl(this._self, this._then);

  final InternalServerError _self;
  final $Res Function(InternalServerError) _then;

  /// Create a copy of NetworkExceptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reason = null,
  }) {
    return _then(InternalServerError(
      null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class NotImplemented implements NetworkExceptions {
  const NotImplemented();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NotImplemented);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NetworkExceptions.notImplemented()';
  }
}

/// @nodoc

class ServiceUnavailable implements NetworkExceptions {
  const ServiceUnavailable();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ServiceUnavailable);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NetworkExceptions.serviceUnavailable()';
  }
}

/// @nodoc

class NoInternetConnection implements NetworkExceptions {
  const NoInternetConnection();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NoInternetConnection);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NetworkExceptions.noInternetConnection()';
  }
}

/// @nodoc

class FormatException implements NetworkExceptions {
  const FormatException();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FormatException);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NetworkExceptions.formatException()';
  }
}

/// @nodoc

class UnableToProcess implements NetworkExceptions {
  const UnableToProcess(this.error);

  final String error;

  /// Create a copy of NetworkExceptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UnableToProcessCopyWith<UnableToProcess> get copyWith =>
      _$UnableToProcessCopyWithImpl<UnableToProcess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnableToProcess &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'NetworkExceptions.unableToProcess(error: $error)';
  }
}

/// @nodoc
abstract mixin class $UnableToProcessCopyWith<$Res>
    implements $NetworkExceptionsCopyWith<$Res> {
  factory $UnableToProcessCopyWith(
          UnableToProcess value, $Res Function(UnableToProcess) _then) =
      _$UnableToProcessCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$UnableToProcessCopyWithImpl<$Res>
    implements $UnableToProcessCopyWith<$Res> {
  _$UnableToProcessCopyWithImpl(this._self, this._then);

  final UnableToProcess _self;
  final $Res Function(UnableToProcess) _then;

  /// Create a copy of NetworkExceptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(UnableToProcess(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class DefaultError implements NetworkExceptions {
  const DefaultError(this.error);

  final String error;

  /// Create a copy of NetworkExceptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DefaultErrorCopyWith<DefaultError> get copyWith =>
      _$DefaultErrorCopyWithImpl<DefaultError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DefaultError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'NetworkExceptions.defaultError(error: $error)';
  }
}

/// @nodoc
abstract mixin class $DefaultErrorCopyWith<$Res>
    implements $NetworkExceptionsCopyWith<$Res> {
  factory $DefaultErrorCopyWith(
          DefaultError value, $Res Function(DefaultError) _then) =
      _$DefaultErrorCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$DefaultErrorCopyWithImpl<$Res> implements $DefaultErrorCopyWith<$Res> {
  _$DefaultErrorCopyWithImpl(this._self, this._then);

  final DefaultError _self;
  final $Res Function(DefaultError) _then;

  /// Create a copy of NetworkExceptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(DefaultError(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class UnexpectedError implements NetworkExceptions {
  const UnexpectedError();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UnexpectedError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NetworkExceptions.unexpectedError()';
  }
}

// dart format on
