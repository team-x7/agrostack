import 'dart:io';

import 'package:agrostack/core/dio/dio_util.dart';
import 'package:agrostack/core/dio/interceptors/dio_helper.dart';
import 'package:agrostack/core/entity/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

final authProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final googleAuthProvider = Provider<GoogleSignIn>((ref) {
  return GoogleSignIn();
});

final authRepositoryProvider = Provider<Authenticator>((ref) {
  return Authenticator(
    firebaseAuth: ref.watch(authProvider),
    googleSignIn: ref.watch(googleAuthProvider),
    dioHelper: ref.watch(dioHelper),
  );
});

class Authenticator {
  const Authenticator({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
    required DioHelper dioHelper,
  })  : _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn,
        _dioHelper = dioHelper;
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final DioHelper _dioHelper;

  // Listen for auth state changes
  Stream<User?> get userChanges => _firebaseAuth.userChanges();

  Future<Either<Failure, User>> createAcccountWithEmailAndPassword({
    required String email,
    required String password,
    required String fullname,
  }) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await result.user?.updateDisplayName.call(fullname);
      if (result.user != null) {
        return right(result.user!);
      }
      return left(Failure('Authentication failed', FailureType.authentication));
    } on FirebaseAuthException catch (e) {
      return left(
        Failure(
          e.message ?? 'Someting went wrong',
          FailureType.authentication,
        ),
      );
    } on PlatformException catch (e) {
      return left(Failure.fromException(e));
    } catch (e) {
      return left(Failure.fromException(e));
    }
  }

  Future<Either<Failure, Unit>> sendPasswordRestLink(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(
        Failure(e.message ?? 'Somethign went wrong', FailureType.unknown),
      );
    }
  }

  Future<Either<Unit, Failure>> setupProfile(Map<String, dynamic> data) async {
    final successOrFailure = await _dioHelper.request(
      reqType: DioMethod.post,
      endpoint: '/profiles',
      reqBody: data,
    );
    return successOrFailure.fold(
      (l) => const Left(unit),
      Right.new,
    );
  }

  Future<Either<Failure, User>> signInWithGoogleAccount() async {
    try {
      final googleAccount = await _googleSignIn.signIn();
      if (googleAccount == null) {
        return left(Failure('Process Aborted', FailureType.authentication));
      }
      final authenticator = await googleAccount.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: authenticator.accessToken,
        idToken: authenticator.idToken,
      );
      final result = await _firebaseAuth.signInWithCredential(credential);
      final providerId = result.additionalUserInfo?.providerId.toString() ?? '';
      if (providerId != 'google.com') {
        await result.user!.linkWithCredential(result.credential!);
      }

      // if (result.user?.providerData.firstWhere((element) =>
      //             element.providerId ==
      //             result.additionalUserInfo?.providerId) ==
      //         null &&
      //     result.user != null) {
      //   await result.user!.linkWithCredential(credential);
      // }

      if (result.user != null) {
        return right(result.user!);
      } else {
        return left(
          Failure('Something went wrong', FailureType.authentication),
        );
      }
    } on FirebaseAuthException catch (e) {
      return left(
        Failure(
          e.message ?? 'Something went wrong',
          FailureType.authentication,
        ),
      );
    } on PlatformException catch (e) {
      return left(
        Failure(
          e.message ?? 'Something went wrong',
          FailureType.authentication,
        ),
      );
      // return left(AuthFailure(code: e.code, message: e.message));
    } on SocketException {
      return left(
        Failure('No internet Connection', FailureType.internet),
      );
    }
  }

  Future<Either<Failure, User>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (result.user != null) {
        return right(result.user!);
      }
      return left(Failure('Authentication failed', FailureType.authentication));
    } on FirebaseAuthException catch (e) {
      return left(
        Failure(
          e.message ?? 'Something went wrong',
          FailureType.authentication,
        ),
      );
    } on PlatformException catch (e) {
      return left(
        Failure(
          e.message ?? 'Something went wrong',
          FailureType.authentication,
        ),
      );
    } catch (e) {
      return left(
        Failure('Something went wrong', FailureType.exception),
      );
    }
  }

  Future<void> signOut() {
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }
}
