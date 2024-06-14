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
    apiKey: 'AIzaSyAqxK8Gb233ONPmK6ZGh3LA_iE8dE40hsA',
    appId: '1:1036949265957:web:4857ccd80db98848e6a9cc',
    messagingSenderId: '1036949265957',
    projectId: 'dan12-9fdc0',
    authDomain: 'dan12-9fdc0.firebaseapp.com',
    storageBucket: 'dan12-9fdc0.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDQXMR2rPC-MPaPYj7YpeUoiU7bRulfDmA',
    appId: '1:1036949265957:android:48cd832b1412ef02e6a9cc',
    messagingSenderId: '1036949265957',
    projectId: 'dan12-9fdc0',
    storageBucket: 'dan12-9fdc0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBUzFydxDdQcq6ii2FEOxZ3zmHVMsO_FSc',
    appId: '1:1036949265957:ios:04a9ff2a72b4f405e6a9cc',
    messagingSenderId: '1036949265957',
    projectId: 'dan12-9fdc0',
    storageBucket: 'dan12-9fdc0.appspot.com',
    iosBundleId: 'com.example.prueba2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBUzFydxDdQcq6ii2FEOxZ3zmHVMsO_FSc',
    appId: '1:1036949265957:ios:04a9ff2a72b4f405e6a9cc',
    messagingSenderId: '1036949265957',
    projectId: 'dan12-9fdc0',
    storageBucket: 'dan12-9fdc0.appspot.com',
    iosBundleId: 'com.example.prueba2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAqxK8Gb233ONPmK6ZGh3LA_iE8dE40hsA',
    appId: '1:1036949265957:web:3edb8dc26dfd819be6a9cc',
    messagingSenderId: '1036949265957',
    projectId: 'dan12-9fdc0',
    authDomain: 'dan12-9fdc0.firebaseapp.com',
    storageBucket: 'dan12-9fdc0.appspot.com',
  );
}
