import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<bool> signIn(String Email, String Password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: Email, password: Password);
    return true;
    
  } catch (e) {
    print(e.toString());

    return false;
  }



}

