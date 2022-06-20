import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlataform {
    if (kIsWeb) {
      // Web
      return const FirebaseOptions(
        appId: '1:204990008762:web:31509de89da3fa78d0e183',
        apiKey: 'AIzaSyDec1pG9ptZGwZC8YwlfqyOi-PsOxeozpk',
        projectId: 'hemih-c2d71',
        messagingSenderId: '204990008762',
      );
    } else if (Platform.isIOS || Platform.isMacOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        appId: '1:204990008762:ios:31509de89da3fa78d0e183',
        apiKey: 'AIzaSyDec1pG9ptZGwZC8YwlfqyOi-PsOxeozpk',
        projectId: 'hemih-c2d71',
        messagingSenderId: '204990008762',
        iosBundleId: 'io.flutter.plugins.firebasecoreexample',
      );
    } else {
      // Android
      return const FirebaseOptions(
        appId: '1:204990008762:android:31509de89da3fa78d0e183',
        apiKey: 'AIzaSyDec1pG9ptZGwZC8YwlfqyOi-PsOxeozpk',
        projectId: 'hemih-c2d71',
        messagingSenderId: '204990008762',
      );
    }
  }
}