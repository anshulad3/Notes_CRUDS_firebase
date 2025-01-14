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
    apiKey: 'AIzaSyAStziGjmYXbaiNiQidlT6ZYpnOa1c-cJ4',
    appId: '1:177908413156:web:fbda6fbea03184778db2f1',
    messagingSenderId: '177908413156',
    projectId: 'notes-crud-20d2c',
    authDomain: 'notes-crud-20d2c.firebaseapp.com',
    storageBucket: 'notes-crud-20d2c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC6ugnz91amzNLuuu8poTCuCALba8spnSY',
    appId: '1:177908413156:android:d72ea35b3e9f24f18db2f1',
    messagingSenderId: '177908413156',
    projectId: 'notes-crud-20d2c',
    storageBucket: 'notes-crud-20d2c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZoCnqtHUHMW9wzeClNlyCEw0TgJlJ8b0',
    appId: '1:177908413156:ios:0ffca3600e2fe3618db2f1',
    messagingSenderId: '177908413156',
    projectId: 'notes-crud-20d2c',
    storageBucket: 'notes-crud-20d2c.appspot.com',
    iosBundleId: 'com.example.crud',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCZoCnqtHUHMW9wzeClNlyCEw0TgJlJ8b0',
    appId: '1:177908413156:ios:0ffca3600e2fe3618db2f1',
    messagingSenderId: '177908413156',
    projectId: 'notes-crud-20d2c',
    storageBucket: 'notes-crud-20d2c.appspot.com',
    iosBundleId: 'com.example.crud',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAStziGjmYXbaiNiQidlT6ZYpnOa1c-cJ4',
    appId: '1:177908413156:web:02feea853b1abd858db2f1',
    messagingSenderId: '177908413156',
    projectId: 'notes-crud-20d2c',
    authDomain: 'notes-crud-20d2c.firebaseapp.com',
    storageBucket: 'notes-crud-20d2c.appspot.com',
  );
}
