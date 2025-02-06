import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCKPaXvDs5CyjhVyk9H_02kCaP6v3cnzb8",
            authDomain: "semana4lunesmatias.firebaseapp.com",
            projectId: "semana4lunesmatias",
            storageBucket: "semana4lunesmatias.firebasestorage.app",
            messagingSenderId: "510412459171",
            appId: "1:510412459171:web:cc9714bc35f4c991b30316",
            measurementId: "G-EBZG77J634"));
  } else {
    await Firebase.initializeApp();
  }
}
