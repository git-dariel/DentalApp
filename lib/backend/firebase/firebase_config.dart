import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCsOU2SPzRUQwr-SuK6f8XCmZGAYx7QfKo",
            authDomain: "dentalclinic112-964b1.firebaseapp.com",
            projectId: "dentalclinic112-964b1",
            storageBucket: "dentalclinic112-964b1.appspot.com",
            messagingSenderId: "12094787925",
            appId: "1:12094787925:web:6ab521e4cc0b71e7b0dfdc"));
  } else {
    await Firebase.initializeApp();
  }
}
