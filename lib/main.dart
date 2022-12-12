import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tiffinpk_web_portal/authentication/login_screen.dart';
import 'package:tiffinpk_web_portal/main_screen/home_screen.dart';
import 'dart:async';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: const  FirebaseOptions(
        apiKey: "AIzaSyDoT5n5arKK1YxBudejdnKprWsokBGIINc",
        authDomain: "tiffan-pk.firebaseapp.com",
        databaseURL: "https://tiffan-pk-default-rtdb.firebaseio.com",
        projectId: "tiffan-pk",
        storageBucket: "tiffan-pk.appspot.com",
        messagingSenderId: "398992383197",
        appId: "1:398992383197:web:4e92ca85e7ab8b46780f34",
        measurementId: "G-H4C25FRBG5"
    ),
  );
  runApp (MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Web Portal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser == null ? const LoginScreen() :const HomeScreen(),
    );
  }
}


