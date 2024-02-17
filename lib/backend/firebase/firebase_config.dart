import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDaBZ-61PCTWyD2NJ08pYPXWkdWPtHzVm4",
            authDomain: "hack-e321d.firebaseapp.com",
            projectId: "hack-e321d",
            storageBucket: "hack-e321d.appspot.com",
            messagingSenderId: "2182529446",
            appId: "1:2182529446:web:1cc8f3c39e99fc82050f67",
            measurementId: "G-4427MCP6V6"));
  } else {
    await Firebase.initializeApp();
  }
}
