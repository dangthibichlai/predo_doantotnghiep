// ignore_for_file: join_return_with_assignment

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
  /// Google logout.
  ///
  Future<void> socialLogout({required SocialType socialType}) async {
    switch (socialType) {
      default:
        _googleSignIn.signOut();

        log('Google logout');
    }
  }
}
