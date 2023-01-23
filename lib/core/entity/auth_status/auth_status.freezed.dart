// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  AuthStatus? get status => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthStatus? status, AuthProvider? provider)
        initial,
    required TResult Function(AuthStatus? status, AuthProvider? provider)
        unauthenticated,
    required TResult Function(AuthStatus? status) setupProfile,
    required TResult Function(
            AuthStatus? status, AuthProvider? provider, User user)
        authenticated,
    required TResult Function(
            Failure failure, AuthStatus? status, AuthProvider? provider)
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthStatus? status, AuthProvider? provider)? initial,
    TResult? Function(AuthStatus? status, AuthProvider? provider)?
        unauthenticated,
    TResult? Function(AuthStatus? status)? setupProfile,
    TResult? Function(AuthStatus? status, AuthProvider? provider, User user)?
        authenticated,
    TResult? Function(
            Failure failure, AuthStatus? status, AuthProvider? provider)?
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthStatus? status, AuthProvider? provider)? initial,
    TResult Function(AuthStatus? status, AuthProvider? provider)?
        unauthenticated,
    TResult Function(AuthStatus? status)? setupProfile,
    TResult Function(AuthStatus? status, AuthProvider? provider, User user)?
        authenticated,
    TResult Function(
            Failure failure, AuthStatus? status, AuthProvider? provider)?
        failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitial value) initial,
    required TResult Function(_AuthUnauthenticated value) unauthenticated,
    required TResult Function(_SetupProfile value) setupProfile,
    required TResult Function(_AuthAuthenticated value) authenticated,
    required TResult Function(_AuthFailed value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInitial value)? initial,
    TResult? Function(_AuthUnauthenticated value)? unauthenticated,
    TResult? Function(_SetupProfile value)? setupProfile,
    TResult? Function(_AuthAuthenticated value)? authenticated,
    TResult? Function(_AuthFailed value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitial value)? initial,
    TResult Function(_AuthUnauthenticated value)? unauthenticated,
    TResult Function(_SetupProfile value)? setupProfile,
    TResult Function(_AuthAuthenticated value)? authenticated,
    TResult Function(_AuthFailed value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call({AuthStatus? status});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthInitialCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$_AuthInitialCopyWith(
          _$_AuthInitial value, $Res Function(_$_AuthInitial) then) =
      __$$_AuthInitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthStatus? status, AuthProvider? provider});
}

/// @nodoc
class __$$_AuthInitialCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthInitial>
    implements _$$_AuthInitialCopyWith<$Res> {
  __$$_AuthInitialCopyWithImpl(
      _$_AuthInitial _value, $Res Function(_$_AuthInitial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? provider = freezed,
  }) {
    return _then(_$_AuthInitial(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as AuthProvider?,
    ));
  }
}

/// @nodoc

class _$_AuthInitial extends _AuthInitial {
  const _$_AuthInitial(
      {this.status = AuthStatus.ideal, this.provider = AuthProvider.none})
      : super._();

  @override
  @JsonKey()
  final AuthStatus? status;
  @override
  @JsonKey()
  final AuthProvider? provider;

  @override
  String toString() {
    return 'AuthState.initial(status: $status, provider: $provider)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthInitial &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.provider, provider) ||
                other.provider == provider));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, provider);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthInitialCopyWith<_$_AuthInitial> get copyWith =>
      __$$_AuthInitialCopyWithImpl<_$_AuthInitial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthStatus? status, AuthProvider? provider)
        initial,
    required TResult Function(AuthStatus? status, AuthProvider? provider)
        unauthenticated,
    required TResult Function(AuthStatus? status) setupProfile,
    required TResult Function(
            AuthStatus? status, AuthProvider? provider, User user)
        authenticated,
    required TResult Function(
            Failure failure, AuthStatus? status, AuthProvider? provider)
        failure,
  }) {
    return initial(status, provider);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthStatus? status, AuthProvider? provider)? initial,
    TResult? Function(AuthStatus? status, AuthProvider? provider)?
        unauthenticated,
    TResult? Function(AuthStatus? status)? setupProfile,
    TResult? Function(AuthStatus? status, AuthProvider? provider, User user)?
        authenticated,
    TResult? Function(
            Failure failure, AuthStatus? status, AuthProvider? provider)?
        failure,
  }) {
    return initial?.call(status, provider);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthStatus? status, AuthProvider? provider)? initial,
    TResult Function(AuthStatus? status, AuthProvider? provider)?
        unauthenticated,
    TResult Function(AuthStatus? status)? setupProfile,
    TResult Function(AuthStatus? status, AuthProvider? provider, User user)?
        authenticated,
    TResult Function(
            Failure failure, AuthStatus? status, AuthProvider? provider)?
        failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(status, provider);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitial value) initial,
    required TResult Function(_AuthUnauthenticated value) unauthenticated,
    required TResult Function(_SetupProfile value) setupProfile,
    required TResult Function(_AuthAuthenticated value) authenticated,
    required TResult Function(_AuthFailed value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInitial value)? initial,
    TResult? Function(_AuthUnauthenticated value)? unauthenticated,
    TResult? Function(_SetupProfile value)? setupProfile,
    TResult? Function(_AuthAuthenticated value)? authenticated,
    TResult? Function(_AuthFailed value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitial value)? initial,
    TResult Function(_AuthUnauthenticated value)? unauthenticated,
    TResult Function(_SetupProfile value)? setupProfile,
    TResult Function(_AuthAuthenticated value)? authenticated,
    TResult Function(_AuthFailed value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _AuthInitial extends AuthState {
  const factory _AuthInitial(
      {final AuthStatus? status,
      final AuthProvider? provider}) = _$_AuthInitial;
  const _AuthInitial._() : super._();

  @override
  AuthStatus? get status;
  AuthProvider? get provider;
  @override
  @JsonKey(ignore: true)
  _$$_AuthInitialCopyWith<_$_AuthInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthUnauthenticatedCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$_AuthUnauthenticatedCopyWith(_$_AuthUnauthenticated value,
          $Res Function(_$_AuthUnauthenticated) then) =
      __$$_AuthUnauthenticatedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthStatus? status, AuthProvider? provider});
}

/// @nodoc
class __$$_AuthUnauthenticatedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthUnauthenticated>
    implements _$$_AuthUnauthenticatedCopyWith<$Res> {
  __$$_AuthUnauthenticatedCopyWithImpl(_$_AuthUnauthenticated _value,
      $Res Function(_$_AuthUnauthenticated) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? provider = freezed,
  }) {
    return _then(_$_AuthUnauthenticated(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as AuthProvider?,
    ));
  }
}

/// @nodoc

class _$_AuthUnauthenticated extends _AuthUnauthenticated {
  const _$_AuthUnauthenticated(
      {this.status = AuthStatus.ideal, this.provider = AuthProvider.none})
      : super._();

  @override
  @JsonKey()
  final AuthStatus? status;
  @override
  @JsonKey()
  final AuthProvider? provider;

  @override
  String toString() {
    return 'AuthState.unauthenticated(status: $status, provider: $provider)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthUnauthenticated &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.provider, provider) ||
                other.provider == provider));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, provider);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthUnauthenticatedCopyWith<_$_AuthUnauthenticated> get copyWith =>
      __$$_AuthUnauthenticatedCopyWithImpl<_$_AuthUnauthenticated>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthStatus? status, AuthProvider? provider)
        initial,
    required TResult Function(AuthStatus? status, AuthProvider? provider)
        unauthenticated,
    required TResult Function(AuthStatus? status) setupProfile,
    required TResult Function(
            AuthStatus? status, AuthProvider? provider, User user)
        authenticated,
    required TResult Function(
            Failure failure, AuthStatus? status, AuthProvider? provider)
        failure,
  }) {
    return unauthenticated(status, provider);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthStatus? status, AuthProvider? provider)? initial,
    TResult? Function(AuthStatus? status, AuthProvider? provider)?
        unauthenticated,
    TResult? Function(AuthStatus? status)? setupProfile,
    TResult? Function(AuthStatus? status, AuthProvider? provider, User user)?
        authenticated,
    TResult? Function(
            Failure failure, AuthStatus? status, AuthProvider? provider)?
        failure,
  }) {
    return unauthenticated?.call(status, provider);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthStatus? status, AuthProvider? provider)? initial,
    TResult Function(AuthStatus? status, AuthProvider? provider)?
        unauthenticated,
    TResult Function(AuthStatus? status)? setupProfile,
    TResult Function(AuthStatus? status, AuthProvider? provider, User user)?
        authenticated,
    TResult Function(
            Failure failure, AuthStatus? status, AuthProvider? provider)?
        failure,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(status, provider);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitial value) initial,
    required TResult Function(_AuthUnauthenticated value) unauthenticated,
    required TResult Function(_SetupProfile value) setupProfile,
    required TResult Function(_AuthAuthenticated value) authenticated,
    required TResult Function(_AuthFailed value) failure,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInitial value)? initial,
    TResult? Function(_AuthUnauthenticated value)? unauthenticated,
    TResult? Function(_SetupProfile value)? setupProfile,
    TResult? Function(_AuthAuthenticated value)? authenticated,
    TResult? Function(_AuthFailed value)? failure,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitial value)? initial,
    TResult Function(_AuthUnauthenticated value)? unauthenticated,
    TResult Function(_SetupProfile value)? setupProfile,
    TResult Function(_AuthAuthenticated value)? authenticated,
    TResult Function(_AuthFailed value)? failure,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _AuthUnauthenticated extends AuthState {
  const factory _AuthUnauthenticated(
      {final AuthStatus? status,
      final AuthProvider? provider}) = _$_AuthUnauthenticated;
  const _AuthUnauthenticated._() : super._();

  @override
  AuthStatus? get status;
  AuthProvider? get provider;
  @override
  @JsonKey(ignore: true)
  _$$_AuthUnauthenticatedCopyWith<_$_AuthUnauthenticated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetupProfileCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$_SetupProfileCopyWith(
          _$_SetupProfile value, $Res Function(_$_SetupProfile) then) =
      __$$_SetupProfileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthStatus? status});
}

/// @nodoc
class __$$_SetupProfileCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_SetupProfile>
    implements _$$_SetupProfileCopyWith<$Res> {
  __$$_SetupProfileCopyWithImpl(
      _$_SetupProfile _value, $Res Function(_$_SetupProfile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$_SetupProfile(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus?,
    ));
  }
}

/// @nodoc

class _$_SetupProfile extends _SetupProfile {
  const _$_SetupProfile({this.status = AuthStatus.ideal}) : super._();

  @override
  @JsonKey()
  final AuthStatus? status;

  @override
  String toString() {
    return 'AuthState.setupProfile(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetupProfile &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetupProfileCopyWith<_$_SetupProfile> get copyWith =>
      __$$_SetupProfileCopyWithImpl<_$_SetupProfile>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthStatus? status, AuthProvider? provider)
        initial,
    required TResult Function(AuthStatus? status, AuthProvider? provider)
        unauthenticated,
    required TResult Function(AuthStatus? status) setupProfile,
    required TResult Function(
            AuthStatus? status, AuthProvider? provider, User user)
        authenticated,
    required TResult Function(
            Failure failure, AuthStatus? status, AuthProvider? provider)
        failure,
  }) {
    return setupProfile(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthStatus? status, AuthProvider? provider)? initial,
    TResult? Function(AuthStatus? status, AuthProvider? provider)?
        unauthenticated,
    TResult? Function(AuthStatus? status)? setupProfile,
    TResult? Function(AuthStatus? status, AuthProvider? provider, User user)?
        authenticated,
    TResult? Function(
            Failure failure, AuthStatus? status, AuthProvider? provider)?
        failure,
  }) {
    return setupProfile?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthStatus? status, AuthProvider? provider)? initial,
    TResult Function(AuthStatus? status, AuthProvider? provider)?
        unauthenticated,
    TResult Function(AuthStatus? status)? setupProfile,
    TResult Function(AuthStatus? status, AuthProvider? provider, User user)?
        authenticated,
    TResult Function(
            Failure failure, AuthStatus? status, AuthProvider? provider)?
        failure,
    required TResult orElse(),
  }) {
    if (setupProfile != null) {
      return setupProfile(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitial value) initial,
    required TResult Function(_AuthUnauthenticated value) unauthenticated,
    required TResult Function(_SetupProfile value) setupProfile,
    required TResult Function(_AuthAuthenticated value) authenticated,
    required TResult Function(_AuthFailed value) failure,
  }) {
    return setupProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInitial value)? initial,
    TResult? Function(_AuthUnauthenticated value)? unauthenticated,
    TResult? Function(_SetupProfile value)? setupProfile,
    TResult? Function(_AuthAuthenticated value)? authenticated,
    TResult? Function(_AuthFailed value)? failure,
  }) {
    return setupProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitial value)? initial,
    TResult Function(_AuthUnauthenticated value)? unauthenticated,
    TResult Function(_SetupProfile value)? setupProfile,
    TResult Function(_AuthAuthenticated value)? authenticated,
    TResult Function(_AuthFailed value)? failure,
    required TResult orElse(),
  }) {
    if (setupProfile != null) {
      return setupProfile(this);
    }
    return orElse();
  }
}

abstract class _SetupProfile extends AuthState {
  const factory _SetupProfile({final AuthStatus? status}) = _$_SetupProfile;
  const _SetupProfile._() : super._();

  @override
  AuthStatus? get status;
  @override
  @JsonKey(ignore: true)
  _$$_SetupProfileCopyWith<_$_SetupProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthAuthenticatedCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$_AuthAuthenticatedCopyWith(_$_AuthAuthenticated value,
          $Res Function(_$_AuthAuthenticated) then) =
      __$$_AuthAuthenticatedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthStatus? status, AuthProvider? provider, User user});
}

/// @nodoc
class __$$_AuthAuthenticatedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthAuthenticated>
    implements _$$_AuthAuthenticatedCopyWith<$Res> {
  __$$_AuthAuthenticatedCopyWithImpl(
      _$_AuthAuthenticated _value, $Res Function(_$_AuthAuthenticated) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? provider = freezed,
    Object? user = null,
  }) {
    return _then(_$_AuthAuthenticated(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as AuthProvider?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$_AuthAuthenticated extends _AuthAuthenticated {
  const _$_AuthAuthenticated(
      {this.status = AuthStatus.ideal,
      this.provider = AuthProvider.none,
      required this.user})
      : super._();

  @override
  @JsonKey()
  final AuthStatus? status;
  @override
  @JsonKey()
  final AuthProvider? provider;
  @override
  final User user;

  @override
  String toString() {
    return 'AuthState.authenticated(status: $status, provider: $provider, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthAuthenticated &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, provider, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthAuthenticatedCopyWith<_$_AuthAuthenticated> get copyWith =>
      __$$_AuthAuthenticatedCopyWithImpl<_$_AuthAuthenticated>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthStatus? status, AuthProvider? provider)
        initial,
    required TResult Function(AuthStatus? status, AuthProvider? provider)
        unauthenticated,
    required TResult Function(AuthStatus? status) setupProfile,
    required TResult Function(
            AuthStatus? status, AuthProvider? provider, User user)
        authenticated,
    required TResult Function(
            Failure failure, AuthStatus? status, AuthProvider? provider)
        failure,
  }) {
    return authenticated(status, provider, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthStatus? status, AuthProvider? provider)? initial,
    TResult? Function(AuthStatus? status, AuthProvider? provider)?
        unauthenticated,
    TResult? Function(AuthStatus? status)? setupProfile,
    TResult? Function(AuthStatus? status, AuthProvider? provider, User user)?
        authenticated,
    TResult? Function(
            Failure failure, AuthStatus? status, AuthProvider? provider)?
        failure,
  }) {
    return authenticated?.call(status, provider, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthStatus? status, AuthProvider? provider)? initial,
    TResult Function(AuthStatus? status, AuthProvider? provider)?
        unauthenticated,
    TResult Function(AuthStatus? status)? setupProfile,
    TResult Function(AuthStatus? status, AuthProvider? provider, User user)?
        authenticated,
    TResult Function(
            Failure failure, AuthStatus? status, AuthProvider? provider)?
        failure,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(status, provider, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitial value) initial,
    required TResult Function(_AuthUnauthenticated value) unauthenticated,
    required TResult Function(_SetupProfile value) setupProfile,
    required TResult Function(_AuthAuthenticated value) authenticated,
    required TResult Function(_AuthFailed value) failure,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInitial value)? initial,
    TResult? Function(_AuthUnauthenticated value)? unauthenticated,
    TResult? Function(_SetupProfile value)? setupProfile,
    TResult? Function(_AuthAuthenticated value)? authenticated,
    TResult? Function(_AuthFailed value)? failure,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitial value)? initial,
    TResult Function(_AuthUnauthenticated value)? unauthenticated,
    TResult Function(_SetupProfile value)? setupProfile,
    TResult Function(_AuthAuthenticated value)? authenticated,
    TResult Function(_AuthFailed value)? failure,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _AuthAuthenticated extends AuthState {
  const factory _AuthAuthenticated(
      {final AuthStatus? status,
      final AuthProvider? provider,
      required final User user}) = _$_AuthAuthenticated;
  const _AuthAuthenticated._() : super._();

  @override
  AuthStatus? get status;
  AuthProvider? get provider;
  User get user;
  @override
  @JsonKey(ignore: true)
  _$$_AuthAuthenticatedCopyWith<_$_AuthAuthenticated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthFailedCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$_AuthFailedCopyWith(
          _$_AuthFailed value, $Res Function(_$_AuthFailed) then) =
      __$$_AuthFailedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Failure failure, AuthStatus? status, AuthProvider? provider});
}

/// @nodoc
class __$$_AuthFailedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthFailed>
    implements _$$_AuthFailedCopyWith<$Res> {
  __$$_AuthFailedCopyWithImpl(
      _$_AuthFailed _value, $Res Function(_$_AuthFailed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
    Object? status = freezed,
    Object? provider = freezed,
  }) {
    return _then(_$_AuthFailed(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as AuthProvider?,
    ));
  }
}

/// @nodoc

class _$_AuthFailed extends _AuthFailed {
  const _$_AuthFailed(this.failure,
      {this.status = AuthStatus.ideal, this.provider = AuthProvider.none})
      : super._();

  @override
  final Failure failure;
  @override
  @JsonKey()
  final AuthStatus? status;
  @override
  @JsonKey()
  final AuthProvider? provider;

  @override
  String toString() {
    return 'AuthState.failure(failure: $failure, status: $status, provider: $provider)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthFailed &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.provider, provider) ||
                other.provider == provider));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure, status, provider);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthFailedCopyWith<_$_AuthFailed> get copyWith =>
      __$$_AuthFailedCopyWithImpl<_$_AuthFailed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthStatus? status, AuthProvider? provider)
        initial,
    required TResult Function(AuthStatus? status, AuthProvider? provider)
        unauthenticated,
    required TResult Function(AuthStatus? status) setupProfile,
    required TResult Function(
            AuthStatus? status, AuthProvider? provider, User user)
        authenticated,
    required TResult Function(
            Failure failure, AuthStatus? status, AuthProvider? provider)
        failure,
  }) {
    return failure(this.failure, status, provider);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthStatus? status, AuthProvider? provider)? initial,
    TResult? Function(AuthStatus? status, AuthProvider? provider)?
        unauthenticated,
    TResult? Function(AuthStatus? status)? setupProfile,
    TResult? Function(AuthStatus? status, AuthProvider? provider, User user)?
        authenticated,
    TResult? Function(
            Failure failure, AuthStatus? status, AuthProvider? provider)?
        failure,
  }) {
    return failure?.call(this.failure, status, provider);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthStatus? status, AuthProvider? provider)? initial,
    TResult Function(AuthStatus? status, AuthProvider? provider)?
        unauthenticated,
    TResult Function(AuthStatus? status)? setupProfile,
    TResult Function(AuthStatus? status, AuthProvider? provider, User user)?
        authenticated,
    TResult Function(
            Failure failure, AuthStatus? status, AuthProvider? provider)?
        failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this.failure, status, provider);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInitial value) initial,
    required TResult Function(_AuthUnauthenticated value) unauthenticated,
    required TResult Function(_SetupProfile value) setupProfile,
    required TResult Function(_AuthAuthenticated value) authenticated,
    required TResult Function(_AuthFailed value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInitial value)? initial,
    TResult? Function(_AuthUnauthenticated value)? unauthenticated,
    TResult? Function(_SetupProfile value)? setupProfile,
    TResult? Function(_AuthAuthenticated value)? authenticated,
    TResult? Function(_AuthFailed value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInitial value)? initial,
    TResult Function(_AuthUnauthenticated value)? unauthenticated,
    TResult Function(_SetupProfile value)? setupProfile,
    TResult Function(_AuthAuthenticated value)? authenticated,
    TResult Function(_AuthFailed value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _AuthFailed extends AuthState {
  const factory _AuthFailed(final Failure failure,
      {final AuthStatus? status, final AuthProvider? provider}) = _$_AuthFailed;
  const _AuthFailed._() : super._();

  Failure get failure;
  @override
  AuthStatus? get status;
  AuthProvider? get provider;
  @override
  @JsonKey(ignore: true)
  _$$_AuthFailedCopyWith<_$_AuthFailed> get copyWith =>
      throw _privateConstructorUsedError;
}
