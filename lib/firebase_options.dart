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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCtM0KknBGWCHXlOK_774-mToKjUYguq0Q',
    appId: '1:753862377991:web:c9316f3f436daaa5db20a2',
    messagingSenderId: '753862377991',
    projectId: 'portfolio-6d2ab',
    authDomain: 'portfolio-6d2ab.firebaseapp.com',
    databaseURL: 'https://portfolio-6d2ab.firebaseio.com',
    storageBucket: 'portfolio-6d2ab.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCgQykN7iadgyh9mv8ThHxPQF9JF30SUSw',
    appId: '1:753862377991:android:0a3a8e94d1a1d24fdb20a2',
    messagingSenderId: '753862377991',
    projectId: 'portfolio-6d2ab',
    databaseURL: 'https://portfolio-6d2ab.firebaseio.com',
    storageBucket: 'portfolio-6d2ab.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB2ZPMdEiWJeA2cKGGJ8PueRRizMwIBV8M',
    appId: '1:753862377991:ios:3e10bf816b64c1dedb20a2',
    messagingSenderId: '753862377991',
    projectId: 'portfolio-6d2ab',
    databaseURL: 'https://portfolio-6d2ab.firebaseio.com',
    storageBucket: 'portfolio-6d2ab.appspot.com',
    iosClientId: '753862377991-0bl9ru2rb39oek4res9tnvo8tbcck2n4.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterWebPortfolio',
  );
}
