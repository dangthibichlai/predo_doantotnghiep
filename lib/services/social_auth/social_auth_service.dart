// ignore_for_file: join_return_with_assignment

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:test_intern/core/enums/enums.dart';
import 'package:test_intern/firebase_options.dart';

class SocialAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
      clientId: (DefaultFirebaseOptions.currentPlatform == DefaultFirebaseOptions.ios)
          ? DefaultFirebaseOptions.currentPlatform.iosClientId
          : DefaultFirebaseOptions.currentPlatform.androidClientId);

  ///
  /// Google auth.
  ///
  Future<UserCredential?> googleAuth() async {
    final GoogleSignInAccount? gUser = await _googleSignIn.signIn();

    if (gUser == null) {
      return null;
    }
    EasyLoading.show(status: 'other_0024'.tr);

    //
    // Begin google sign in.
    final GoogleSignInAuthentication _googleAuth = await gUser.authentication;

    //
    // Obtain the auth request.
    final AuthCredential _credential = GoogleAuthProvider.credential(
      accessToken: _googleAuth.accessToken,
      idToken: _googleAuth.idToken,
    );

    // Create a new Auth instance.

    return FirebaseAuth.instance.signInWithCredential(_credential);
  }

  ///
  /// Facebook auth.
  ///
  Future<UserCredential?> facebookAuth() async {
    final _loginResult = await FacebookAuth.instance.login();

    EasyLoading.show(status: 'other_0025'.tr);

    if (_loginResult.status == LoginStatus.success) {
      // Obtain the auth request.
      final OAuthCredential _credential = FacebookAuthProvider.credential(_loginResult.accessToken!.token);

      return FirebaseAuth.instance.signInWithCredential(_credential);
    } else {
      log('Facebook auth ResultStatus: ${_loginResult.status}');
      log('Facebook auth Message: ${_loginResult.message}');

      return null;
    }
  }

  ///
  /// Google logout.
  ///
  Future<void> socialLogout({required SocialType socialType}) async {
    await FacebookAuth.instance.logOut();
    switch (socialType) {
      case SocialType.FACEBOOK:
        await FacebookAuth.instance.logOut();

        log('Facebook logout');

        break;
      // case SocialType.APPLE:
      //   log('Apple logout');

      //   break;
      default:
        _googleSignIn.signOut();

        log('Google logout');
    }
  }
}
