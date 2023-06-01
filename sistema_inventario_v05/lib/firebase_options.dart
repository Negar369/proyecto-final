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
    apiKey: 'AIzaSyAsNPQNbloXLGh5h0npBK197_KrmnnSPSk',
    appId: '1:783963060275:web:0cac22f6e3c294420ccb46',
    messagingSenderId: '783963060275',
    projectId: 'sistema-inventario-v02',
    authDomain: 'sistema-inventario-v02.firebaseapp.com',
    storageBucket: 'sistema-inventario-v02.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAp0EjNicVJDYjUXR4GdPNQEFAkInpN-Rw',
    appId: '1:783963060275:android:80e3cc1bee6c7b970ccb46',
    messagingSenderId: '783963060275',
    projectId: 'sistema-inventario-v02',
    storageBucket: 'sistema-inventario-v02.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDmytZHa4m-7u2Z9w9umO40GO2Zq7iQmOU',
    appId: '1:783963060275:ios:df5a19f07f24660c0ccb46',
    messagingSenderId: '783963060275',
    projectId: 'sistema-inventario-v02',
    storageBucket: 'sistema-inventario-v02.appspot.com',
    iosBundleId: 'com.example.sistemaInventarioV05',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDmytZHa4m-7u2Z9w9umO40GO2Zq7iQmOU',
    appId: '1:783963060275:ios:c048518b1e81e3bf0ccb46',
    messagingSenderId: '783963060275',
    projectId: 'sistema-inventario-v02',
    storageBucket: 'sistema-inventario-v02.appspot.com',
    iosBundleId: 'com.example.sistemaInventarioV05.RunnerTests',
  );
}