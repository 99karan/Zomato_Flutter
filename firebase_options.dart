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
    apiKey: 'AIzaSyDcsPlrKbbuon7K7CKvWx_nhbeDes3_Hs8',
    appId: '1:103286395686:web:c782e54d6650fc9ff4e7e7',
    messagingSenderId: '103286395686',
    projectId: 'zomatoks-56239',
    authDomain: 'zomatoks-56239.firebaseapp.com',
    databaseURL: 'https://zomatoks-56239-default-rtdb.firebaseio.com',
    storageBucket: 'zomatoks-56239.appspot.com',
    measurementId: 'G-VC7ZQYSYB0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmhpSyKiyzdLaPsU9koeKou3C2bozomuI',
    appId: '1:103286395686:android:2de644656a4c0cebf4e7e7',
    messagingSenderId: '103286395686',
    projectId: 'zomatoks-56239',
    databaseURL: 'https://zomatoks-56239-default-rtdb.firebaseio.com',
    storageBucket: 'zomatoks-56239.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCaKxFtBEceY-7UBmouTzasDug0SKprhxY',
    appId: '1:103286395686:ios:b16966eb8a8b0737f4e7e7',
    messagingSenderId: '103286395686',
    projectId: 'zomatoks-56239',
    databaseURL: 'https://zomatoks-56239-default-rtdb.firebaseio.com',
    storageBucket: 'zomatoks-56239.appspot.com',
    iosBundleId: 'com.example.zomatoks',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCaKxFtBEceY-7UBmouTzasDug0SKprhxY',
    appId: '1:103286395686:ios:86c56c45f56d95f5f4e7e7',
    messagingSenderId: '103286395686',
    projectId: 'zomatoks-56239',
    databaseURL: 'https://zomatoks-56239-default-rtdb.firebaseio.com',
    storageBucket: 'zomatoks-56239.appspot.com',
    iosBundleId: 'com.example.zomatoks.RunnerTests',
  );
}
