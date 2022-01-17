// ignore: file_names
// ignore: file_names
// ignore: file_names

// ignore_for_file: file_names

import 'package:admin_portal/screens/Authercation/aurhencation_logic.dart';
import 'package:admin_portal/screens/Home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
      body: Center(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 20),
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 5,
                  child: Image.asset("loodslogo.png")),
              Container(
                  padding: EdgeInsets.only(top: 30, bottom: 30),
                  child: const Text(
                    "Aanmelden met uw bestaande account",
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                width: MediaQuery.of(context).size.width / 2.5,
                decoration: BoxDecoration(color: HexColor("#cbc2ae")),
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    label: Text("Email"),
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  controller: _emailField,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2.5,
                decoration: BoxDecoration(color: HexColor("#cbc2ae")),
                child: TextField(
                  cursorColor: Colors.black,
                  obscureText: true,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    label: const Text("Wachtwoord"),
                    labelStyle: TextStyle(color: Colors.black),
                  ),

                  controller: _passwordField,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(TextMessage),
              Container(
                  height: MediaQuery.of(context).size.height / 11,
                  width: MediaQuery.of(context).size.width / 5,
                  decoration: BoxDecoration(color: HexColor("#A1813D")),
                  child: MaterialButton(
                    onPressed: () async {
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _emailField.text,
                            password: _passwordField.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => homePage()));
                      } catch (e) {
                        print(e.toString());
                        setState(() {
                          TextMessage = "Incorrect";
                        });
                      }
                    },
                    child: const Text(
                      "Aanmelden",
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
