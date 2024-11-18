import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA8W0XaacupL9XMFytH-rncNi3yRlEB4VE',
    appId: '1:248480946888:android:767c5df3669b7cdaef63fd',
    messagingSenderId: '248480946888',
    projectId: 'emvite-8d041',
  );
}
