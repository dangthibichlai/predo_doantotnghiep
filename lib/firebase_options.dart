// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDYYc2IjOvIKdMZ89Eyx-rVgA4mkJqeY0A',
    appId: '1:260516675939:web:b150df32d437cb4c3a1356',
    messagingSenderId: '260516675939',
    projectId: 'predo-2b815',
    authDomain: 'predo-2b815.firebaseapp.com',
    storageBucket: 'predo-2b815.appspot.com',
    measurementId: 'G-JNB5QWGZVY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBs2grP_m4N728eQMVfEPxU65OOEmucOZU',
    appId: '1:260516675939:android:4bbb4913a2c95c243a1356',
    messagingSenderId: '260516675939',
    projectId: 'predo-2b815',
    storageBucket: 'predo-2b815.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC8xXDhXESU9ZGC_9yEBjprHmjYJMEAj_s',
    appId: '1:260516675939:ios:9827e4aaceddfa833a1356',
    messagingSenderId: '260516675939',
    projectId: 'predo-2b815',
    storageBucket: 'predo-2b815.appspot.com',
    iosBundleId: 'com.example.movieExcercise',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC8xXDhXESU9ZGC_9yEBjprHmjYJMEAj_s',
    appId: '1:260516675939:ios:817ce30bcfd2ae293a1356',
    messagingSenderId: '260516675939',
    projectId: 'predo-2b815',
    storageBucket: 'predo-2b815.appspot.com',
    iosBundleId: 'com.example.movieExcercise.RunnerTests',
  );
}
