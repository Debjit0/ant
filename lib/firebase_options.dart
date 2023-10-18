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
    apiKey: 'AIzaSyC9CV1hI77wRc-619T5S6aHrxucKuL2mHc',
    appId: '1:822716013306:web:4cc3c1e417f453fd5d4743',
    messagingSenderId: '822716013306',
    projectId: 'antamit-e2b26',
    authDomain: 'antamit-e2b26.firebaseapp.com',
    storageBucket: 'antamit-e2b26.appspot.com',
    measurementId: 'G-855C7H1BS2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDhzq5fGs8Sb_MRHjLiFi916u-lynzmg4M',
    appId: '1:822716013306:android:c1c294ebbf603a755d4743',
    messagingSenderId: '822716013306',
    projectId: 'antamit-e2b26',
    storageBucket: 'antamit-e2b26.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCdNxOdVApIYhhaSOwpmQ3duvODiH3wjos',
    appId: '1:822716013306:ios:5e285f13af9662625d4743',
    messagingSenderId: '822716013306',
    projectId: 'antamit-e2b26',
    storageBucket: 'antamit-e2b26.appspot.com',
    androidClientId: '822716013306-1k6i51r5aj762u13rl1ckne65osgo6tr.apps.googleusercontent.com',
    iosClientId: '822716013306-nshhcs210oendlb6n6b3jgfn7prcnsqv.apps.googleusercontent.com',
    iosBundleId: 'com.example.ant',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCdNxOdVApIYhhaSOwpmQ3duvODiH3wjos',
    appId: '1:822716013306:ios:0d8937e28373ddae5d4743',
    messagingSenderId: '822716013306',
    projectId: 'antamit-e2b26',
    storageBucket: 'antamit-e2b26.appspot.com',
    androidClientId: '822716013306-1k6i51r5aj762u13rl1ckne65osgo6tr.apps.googleusercontent.com',
    iosClientId: '822716013306-k6ui08dv3gf6dhkek734uc3s4tc8h5u5.apps.googleusercontent.com',
    iosBundleId: 'com.example.ant.RunnerTests',
  );
}