// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCKeRVc5NN6Hl8c8rlPRyKJgkOZMrZ3sxI',
    appId: '1:68178224565:web:9225eb3f1205ec58bb65fc',
    messagingSenderId: '68178224565',
    projectId: 'thecalamfalak',
    authDomain: 'thecalamfalak.firebaseapp.com',
    storageBucket: 'thecalamfalak.appspot.com',
    measurementId: 'G-EJBEP97C89',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDifE3mXG8YVwbia3kNxTsXl6XEl7aiL_I',
    appId: '1:68178224565:android:752cc06987eeb3e8bb65fc',
    messagingSenderId: '68178224565',
    projectId: 'thecalamfalak',
    storageBucket: 'thecalamfalak.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAyChCFyURASw7-QccKSCCrmSINz9liCYc',
    appId: '1:68178224565:ios:ad562ec5e2ff485fbb65fc',
    messagingSenderId: '68178224565',
    projectId: 'thecalamfalak',
    storageBucket: 'thecalamfalak.appspot.com',
    iosBundleId: 'com.example.fluttersAppOfAsad',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAyChCFyURASw7-QccKSCCrmSINz9liCYc',
    appId: '1:68178224565:ios:ad562ec5e2ff485fbb65fc',
    messagingSenderId: '68178224565',
    projectId: 'thecalamfalak',
    storageBucket: 'thecalamfalak.appspot.com',
    iosBundleId: 'com.example.fluttersAppOfAsad',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCKeRVc5NN6Hl8c8rlPRyKJgkOZMrZ3sxI',
    appId: '1:68178224565:web:af4600c1e79060d5bb65fc',
    messagingSenderId: '68178224565',
    projectId: 'thecalamfalak',
    authDomain: 'thecalamfalak.firebaseapp.com',
    storageBucket: 'thecalamfalak.appspot.com',
    measurementId: 'G-KMKR9JNR4R',
  );
}
