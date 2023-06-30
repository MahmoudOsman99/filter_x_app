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
    apiKey: 'AIzaSyCc3M5_q_cG3QlZVc6ug4vVcCfoZ8POx78',
    appId: '1:586122152554:web:986e7d512b1b06d20c5813',
    messagingSenderId: '586122152554',
    projectId: 'filter-x-app',
    authDomain: 'filter-x-app.firebaseapp.com',
    storageBucket: 'filter-x-app.appspot.com',
    measurementId: 'G-9XJJTJ46QM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBwGb2U96HD9-9T0gl91rGfW99YsGiYvXg',
    appId: '1:586122152554:android:d5bb5d954c70f1db0c5813',
    messagingSenderId: '586122152554',
    projectId: 'filter-x-app',
    storageBucket: 'filter-x-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC8KgYRXKut-H6kGXjcjn-P_zIoLTwgdUo',
    appId: '1:586122152554:ios:49caef5f331145bb0c5813',
    messagingSenderId: '586122152554',
    projectId: 'filter-x-app',
    storageBucket: 'filter-x-app.appspot.com',
    iosClientId: '586122152554-3dm17b14gcsbil1046g3ccsh7hudkhn8.apps.googleusercontent.com',
    iosBundleId: 'com.osman.filterx',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC8KgYRXKut-H6kGXjcjn-P_zIoLTwgdUo',
    appId: '1:586122152554:ios:e0e287962ce80c380c5813',
    messagingSenderId: '586122152554',
    projectId: 'filter-x-app',
    storageBucket: 'filter-x-app.appspot.com',
    iosClientId: '586122152554-od0e36bvsnoapa7eeia8v24t3s15tbf5.apps.googleusercontent.com',
    iosBundleId: 'com.osman.filterx.RunnerTests',
  );
}