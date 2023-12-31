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
    apiKey: 'AIzaSyDT7UsPYcIoIGADcMUzJzLd2HLWZs-BKhQ',
    appId: '1:705663978308:web:9a8d117c6e949c34252511',
    messagingSenderId: '705663978308',
    projectId: 'card-exchange-cd112',
    authDomain: 'card-exchange-cd112.firebaseapp.com',
    storageBucket: 'card-exchange-cd112.appspot.com',
    measurementId: 'G-QDHBMS2TLQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDoUoOerEUZk_HQYdrTA8CKom__TsKm-bI',
    appId: '1:705663978308:android:ad8007acbd714870252511',
    messagingSenderId: '705663978308',
    projectId: 'card-exchange-cd112',
    storageBucket: 'card-exchange-cd112.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCaGNHQ2cvq4C0AxZZhFD-rGJWFebVoTu8',
    appId: '1:705663978308:ios:3e7f141d4c7d3cb7252511',
    messagingSenderId: '705663978308',
    projectId: 'card-exchange-cd112',
    storageBucket: 'card-exchange-cd112.appspot.com',
    iosClientId: '705663978308-h9rs0ss0m6rf9miref11k26jgdqo7att.apps.googleusercontent.com',
    iosBundleId: 'jp.ac.hal.cardexchange.cardExchange',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCaGNHQ2cvq4C0AxZZhFD-rGJWFebVoTu8',
    appId: '1:705663978308:ios:c00b6c3d637edd67252511',
    messagingSenderId: '705663978308',
    projectId: 'card-exchange-cd112',
    storageBucket: 'card-exchange-cd112.appspot.com',
    iosClientId: '705663978308-600ucn1vpamur6r349geaam2o76cr215.apps.googleusercontent.com',
    iosBundleId: 'jp.ac.hal.cardexchange.cardExchange.RunnerTests',
  );
}
