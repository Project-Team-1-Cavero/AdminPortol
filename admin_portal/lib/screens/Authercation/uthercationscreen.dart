// ignore: file_names
// ignore: file_names
// ignore: file_names

// ignore_for_file: file_names

import 'package:admin_portal/screens/Authercation/aurhencation_logic.dart';
import 'package:admin_portal/screens/Home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class AuthercationScreen extends StatefulWidget {
  const AuthercationScreen({Key? key}) : super(key: key);


  @override
  _AuthercationScreenState createState() => _AuthercationScreenState();
}

class _AuthercationScreenState extends State<AuthercationScreen> {
  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();
  String TextMessage = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Colors.blue),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              child: const Text("Login screen",
              style: TextStyle(fontSize: 20),
              )
              ),
            Container(
              width: MediaQuery.of(context).size.width / 3,
              child: TextField(
                decoration: const InputDecoration(
                  label: Text("Email"),
                  hintText: "Something@gmail.com"
                ),
                controller: _emailField,
                
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3,
              child: TextField(
                obscureText: true,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  label: const Text("Password"),
                  hintText: "Something"

                ),
                controller: _passwordField,
              ),
            ),
            Text(TextMessage),
            MaterialButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailField.text, password: _passwordField.text);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => homePage()));
    
                } catch (e) {
                  print(e.toString());
                  setState(() {
                    
                    TextMessage = "!ncorrect";
                  });
                }
              },
              child: const Text("Signin"),
            )
          ],
        ),
      ),
    );
  }
}