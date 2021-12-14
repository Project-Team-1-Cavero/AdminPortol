import 'package:admin_portal/screens/Authercation/uthercationscreen.dart';
import 'package:admin_portal/screens/Home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:admin_portal/screens/Home/home_page.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late var MyPassword, MyEmail;
  late var x = false;
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  GlobalKey<FormState> fstate = new GlobalKey<FormState>();
  signup() async {
    var form_data = fstate.currentState;
    if (form_data!.validate()) {
      form_data.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: MyEmail, password: MyPassword);
        x = true;

        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          AwesomeDialog(
              context: context,
              title: 'Error',
              body: Text('The password provided is too weak.'))
            ..show();

          ;
        } else if (e.code == 'email-already-in-use') {
          AwesomeDialog(
              context: context,
              title: "Error",
              body: Text('The account already exists for that email.'))
            ..show();
        }
      } catch (e) {
        print(e);
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        SizedBox(
          height: 80,
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Form(
              key: fstate,
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "please enter your email";
                    }

                    return null;
                  },
                  onSaved: (val) {
                    MyEmail = val;
                  },
                  decoration: InputDecoration(
                      hintText: "Email",
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 1))),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  onSaved: (val) {
                    MyPassword = val;
                  },
                  decoration: InputDecoration(
                      hintText: "Password",
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 1))),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: confirmpassword,
                  obscureText: true,
                  validator: (String? value) {
                    if (password.text != confirmpassword.text) {
                      return "Those passwords didn't match. Try again.";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Confirm Password",
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 1))),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () async {
                            try {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => homePage()));
                            } catch (e) {
                              print(e.toString());
                              ;
                            }
                          },
                          icon: Icon(Icons.arrow_back)),
                    ],
                  ),
                ),
                Container(
                  child: MaterialButton(
                    textColor: Colors.black,
                    onPressed: () async {
                      await signup();

                      if (x == true) {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.SUCCES,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Account successfully created',
                        )..show();
                      }
                    },
                    child: Text("create account"),
                  ),
                )
              ])),
        )
      ],
    ));
  }
}
