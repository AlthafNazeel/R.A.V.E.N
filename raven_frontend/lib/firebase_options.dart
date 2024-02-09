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
    apiKey: 'AIzaSyA-ldzRyFQq98DfuFMPCY7cgqZKYqwQfaI',
    appId: '1:593714450873:web:5a80b2e08b062ffcef6668',
    messagingSenderId: '593714450873',
    projectId: 'raven-2e2e0',
    authDomain: 'raven-2e2e0.firebaseapp.com',
    storageBucket: 'raven-2e2e0.appspot.com',
    measurementId: 'G-L5LB30PHN4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAf4AOOZnYfCKqh324OCDnPJeHD52eZ4Ls',
    appId: '1:593714450873:android:4120f6b896d3ac4cef6668',
    messagingSenderId: '593714450873',
    projectId: 'raven-2e2e0',
    storageBucket: 'raven-2e2e0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDIPqb1dKuPsYg5Q0v5Dm7-9870y0T5BAI',
    appId: '1:593714450873:ios:6175921a69eedb5bef6668',
    messagingSenderId: '593714450873',
    projectId: 'raven-2e2e0',
    storageBucket: 'raven-2e2e0.appspot.com',
    iosBundleId: 'com.example.ravenFrontend',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDIPqb1dKuPsYg5Q0v5Dm7-9870y0T5BAI',
    appId: '1:593714450873:ios:0d63aa1a50e28b99ef6668',
    messagingSenderId: '593714450873',
    projectId: 'raven-2e2e0',
    storageBucket: 'raven-2e2e0.appspot.com',
    iosBundleId: 'com.example.ravenFrontend.RunnerTests',
  );
}
