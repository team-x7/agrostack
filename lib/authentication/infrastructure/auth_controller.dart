import 'dart:developer';

import 'package:agrostack/authentication/infrastructure/authenticator.dart';
import 'package:agrostack/core/entity/auth_status/auth_status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.watch(authRepositoryProvider), ref);
});

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this._authenticator, this._ref)
      : super(const AuthState.initial()) {
    checkAndUpdateAuthStatus();
  }
  final Authenticator _authenticator;
  final Ref _ref;

  void checkAndUpdateAuthStatus([bool forceFetch = false]) {
    _authenticator.userChanges.listen((user) async {
      log('FirebaseUser: $user');
      if (user != null) {
        final tokkenResult = await user.getIdTokenResult();
        if (tokkenResult.claims?['profileCreated'] != null) {
          state = AuthState.authenticated(user: user);
        } else {
          state = const AuthState.setupProfile();
        }
      } else {
        // await Purchases.logOut();
        state = const AuthState.unauthenticated(status: AuthStatus.ideal);
      }
    });
  }

  Future<void> loginWithEmail({
    required String email,
    required String password,
  }) async {
    if (state.status == AuthStatus.busy) return;
    state = const AuthState.initial(
      status: AuthStatus.busy,
      provider: AuthProvider.email,
    );
    final successOrFailed = await _authenticator.loginWithEmailAndPassword(
      email: email,
      password: password,
    );

    successOrFailed.fold(
      (l) {
        return state = AuthState.failure(l, status: AuthStatus.ideal);
      },
      (r) => AuthState.authenticated(user: r),
    );
  }

  Future<void> continueWithGoogleAccount() async {
    if (state.status == AuthStatus.busy) return;
    state = const AuthState.initial(
      status: AuthStatus.busy,
      provider: AuthProvider.google,
    );
    final successOrFailed = await _authenticator.signInWithGoogleAccount();

    successOrFailed.fold(
      (l) => state = AuthState.failure(l, status: AuthStatus.ideal),
      (r) => AuthState.authenticated(user: r),
    );
  }

  Future<void> sendResetPasswordLink({
    required String email,
    required void Function() onVerificationSend,
  }) async {
    if (state.status == AuthStatus.busy) return;
    state = const AuthState.initial(status: AuthStatus.busy);
    final successOrFailed = await _authenticator.sendPasswordRestLink(email);
    return successOrFailed.fold(
      (l) => state = AuthState.failure(l, status: AuthStatus.ideal),
      (r) {
        state = state.copyWith(status: AuthStatus.ideal);
        onVerificationSend();
      },
    );
  }

  Future<void> setupProfile({
    required Map<String, dynamic> data,
    required BuildContext context,
  }) async {
    if (state.status == AuthStatus.busy) return;
    state = const AuthState.initial(status: AuthStatus.busy);
    final successOrFailed = await _authenticator.setupProfile(data);
    return successOrFailed.fold(
      (l) {
        state = AuthState.authenticated(
          user: _ref.watch(authProvider).currentUser!,
        );
        Navigator.pop(context);
      },
      (r) {},
    );
  }

  Future<void> createAccountWithEmailPassword({
    required String email,
    required String fullName,
    required String password,
  }) async {
    if (state.status == AuthStatus.busy) return;
    state = const AuthState.initial(
      status: AuthStatus.busy,
      provider: AuthProvider.email,
    );

    final successOrFailed =
        await _authenticator.createAcccountWithEmailAndPassword(
      email: email,
      password: password,
      fullname: fullName,
    );

    successOrFailed.fold(
      (l) => state = AuthState.failure(l, status: AuthStatus.ideal),
      (r) => state = AuthState.authenticated(user: r),
    );
  }

  Future<void> logout() async {
    if (state.status == AuthStatus.busy) return;
    await _authenticator.signOut();
  }
}
