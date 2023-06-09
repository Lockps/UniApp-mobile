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
    apiKey: 'AIzaSyA0LiB7pnRJBJBuLWO-QK6hI_DZMiasYOg',
    appId: '1:490986414878:web:e693d8586132937e3d9f0f',
    messagingSenderId: '490986414878',
    projectId: 'uniapp-6960d',
    authDomain: 'uniapp-6960d.firebaseapp.com',
    storageBucket: 'uniapp-6960d.appspot.com',
    measurementId: 'G-HS6QTZLR8H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDYSBwZ5un-zDn4gE6998MI12ROU7RHQJk',
    appId: '1:490986414878:android:cbf0ba2d6cb2a4553d9f0f',
    messagingSenderId: '490986414878',
    projectId: 'uniapp-6960d',
    storageBucket: 'uniapp-6960d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAprXYqUhzSfow4c6VP1-Hx-MHR1v8POoM',
    appId: '1:490986414878:ios:fad6e7faf42f8ecf3d9f0f',
    messagingSenderId: '490986414878',
    projectId: 'uniapp-6960d',
    storageBucket: 'uniapp-6960d.appspot.com',
    iosClientId: '490986414878-992hqvd7oji0rpojjqrocqjuf289v1ap.apps.googleusercontent.com',
    iosBundleId: 'com.example.projectUni',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAprXYqUhzSfow4c6VP1-Hx-MHR1v8POoM',
    appId: '1:490986414878:ios:fad6e7faf42f8ecf3d9f0f',
    messagingSenderId: '490986414878',
    projectId: 'uniapp-6960d',
    storageBucket: 'uniapp-6960d.appspot.com',
    iosClientId: '490986414878-992hqvd7oji0rpojjqrocqjuf289v1ap.apps.googleusercontent.com',
    iosBundleId: 'com.example.projectUni',
  );
}
