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
    apiKey: 'AIzaSyCzXkC2c9kViYu90EeplTI5dY9YzCMbd2Y',
    appId: '1:624070790088:web:867b66cb41b30a062d8efd',
    messagingSenderId: '624070790088',
    projectId: 'todo-361bd',
    authDomain: 'todo-361bd.firebaseapp.com',
    storageBucket: 'todo-361bd.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCSFt5M-EslMQYizGjKDd68FRVtVKqRdSI',
    appId: '1:624070790088:android:c794905450fb759b2d8efd',
    messagingSenderId: '624070790088',
    projectId: 'todo-361bd',
    storageBucket: 'todo-361bd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDa5QsgaEsDzBU1mXvn2bEoKWqHG_7Ygyw',
    appId: '1:624070790088:ios:170feded11c62a832d8efd',
    messagingSenderId: '624070790088',
    projectId: 'todo-361bd',
    storageBucket: 'todo-361bd.appspot.com',
    iosBundleId: 'com.example.todoWithFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDa5QsgaEsDzBU1mXvn2bEoKWqHG_7Ygyw',
    appId: '1:624070790088:ios:97bd8d0ef0dcb1302d8efd',
    messagingSenderId: '624070790088',
    projectId: 'todo-361bd',
    storageBucket: 'todo-361bd.appspot.com',
    iosBundleId: 'com.example.todoWithFirebase.RunnerTests',
  );
}
