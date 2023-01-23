import 'package:agrostack/core/entity/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_status.freezed.dart';

enum AuthStatus { ideal, busy }

enum AuthProvider { none, email, apple, google }

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.initial({
    @Default(AuthStatus.ideal) AuthStatus? status,
    @Default(AuthProvider.none) AuthProvider? provider,
  }) = _AuthInitial;
  const factory AuthState.unauthenticated({
    @Default(AuthStatus.ideal) AuthStatus? status,
    @Default(AuthProvider.none) AuthProvider? provider,
  }) = _AuthUnauthenticated;
  const factory AuthState.setupProfile({
    @Default(AuthStatus.ideal) AuthStatus? status,
  }) = _SetupProfile;
  const factory AuthState.authenticated({
    @Default(AuthStatus.ideal) AuthStatus? status,
    @Default(AuthProvider.none) AuthProvider? provider,
    required User user,
  }) = _AuthAuthenticated;
  const factory AuthState.failure(
    Failure failure, {
    @Default(AuthStatus.ideal) AuthStatus? status,
    @Default(AuthProvider.none) AuthProvider? provider,
  }) = _AuthFailed;
}
