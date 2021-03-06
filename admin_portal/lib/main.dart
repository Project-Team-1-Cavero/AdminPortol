import 'package:admin_portal/screens/Authercation/SignUp.dart';
import 'package:admin_portal/screens/Authercation/uthercationscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Admin Portal',
        theme: ThemeData(scaffoldBackgroundColor: HexColor("#385051")),
        home: Scaffold(
          body: AuthercationScreen(),
        ));
  }
}
