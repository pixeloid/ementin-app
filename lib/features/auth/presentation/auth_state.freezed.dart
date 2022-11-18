// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  bool get isBusy => throw _privateConstructorUsedError;
  bool get isLoggedIn => throw _privateConstructorUsedError;
  Map<dynamic, dynamic>? get data => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
  $Res call(
      {bool isBusy,
      bool isLoggedIn,
      Map<dynamic, dynamic>? data,
      String? errorMessage});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;

  @override
  $Res call({
    Object? isBusy = freezed,
    Object? isLoggedIn = freezed,
    Object? data = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isBusy: isBusy == freezed
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoggedIn: isLoggedIn == freezed
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>?,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_Auth0StateCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$_Auth0StateCopyWith(
          _$_Auth0State value, $Res Function(_$_Auth0State) then) =
      __$$_Auth0StateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isBusy,
      bool isLoggedIn,
      Map<dynamic, dynamic>? data,
      String? errorMessage});
}

/// @nodoc
class __$$_Auth0StateCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$$_Auth0StateCopyWith<$Res> {
  __$$_Auth0StateCopyWithImpl(
      _$_Auth0State _value, $Res Function(_$_Auth0State) _then)
      : super(_value, (v) => _then(v as _$_Auth0State));

  @override
  _$_Auth0State get _value => super._value as _$_Auth0State;

  @override
  $Res call({
    Object? isBusy = freezed,
    Object? isLoggedIn = freezed,
    Object? data = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_Auth0State(
      isBusy: isBusy == freezed
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoggedIn: isLoggedIn == freezed
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      data: data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>?,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Auth0State implements _Auth0State {
  const _$_Auth0State(
      {this.isBusy = false,
      this.isLoggedIn = false,
      final Map<dynamic, dynamic>? data,
      this.errorMessage})
      : _data = data;

  @override
  @JsonKey()
  final bool isBusy;
  @override
  @JsonKey()
  final bool isLoggedIn;
  final Map<dynamic, dynamic>? _data;
  @override
  Map<dynamic, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'AuthState(isBusy: $isBusy, isLoggedIn: $isLoggedIn, data: $data, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Auth0State &&
            const DeepCollectionEquality().equals(other.isBusy, isBusy) &&
            const DeepCollectionEquality()
                .equals(other.isLoggedIn, isLoggedIn) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isBusy),
      const DeepCollectionEquality().hash(isLoggedIn),
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  _$$_Auth0StateCopyWith<_$_Auth0State> get copyWith =>
      __$$_Auth0StateCopyWithImpl<_$_Auth0State>(this, _$identity);
}

abstract class _Auth0State implements AuthState {
  const factory _Auth0State(
      {final bool isBusy,
      final bool isLoggedIn,
      final Map<dynamic, dynamic>? data,
      final String? errorMessage}) = _$_Auth0State;

  @override
  bool get isBusy;
  @override
  bool get isLoggedIn;
  @override
  Map<dynamic, dynamic>? get data;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_Auth0StateCopyWith<_$_Auth0State> get copyWith =>
      throw _privateConstructorUsedError;
}
