import 'package:admin_portal/screens/Authercation/uthercationscreen.dart';
import 'package:admin_portal/screens/Home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: duplicate_import
import 'package:admin_portal/screens/Home/home_page.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:hexcolor/hexcolor.dart';

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
            title: 'The password provided is too weak',
            width: 500,
          )..show();

          ;
        } else if (e.code == 'email-already-in-use') {
          AwesomeDialog(
            context: context,
            title: "The account already exists for that email",
            width: 500,
          )..show();
        }
      } catch (e) {
        print(e);
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: Center(
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width * 0.8,
        child: ListView(
          children: [
            Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 20),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 5,
                child: Image.asset("loodslogo.png")),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Form(
                  key: fstate,
                  child: Column(children: [
                    SizedBox(
                      height: 30,
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
                          filled: true,
                          constraints: const BoxConstraints.expand(
                            height: 80,
                            width: 600,
                          ),
                          fillColor: HexColor("#cbc2ae"),
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                          )),
                    ),
                    TextFormField(
                      controller: password,
                      obscureText: true,
                      onSaved: (val) {
                        MyPassword = val;
                      },
                      decoration: InputDecoration(
                          filled: true,
                          constraints:
                              BoxConstraints.tight(const Size(600, 50)),
                          fillColor: HexColor("#cbc2ae"),
                          hintText: "Password",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                    ),
                    SizedBox(height: 30),
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
                          filled: true,
                          constraints: const BoxConstraints.expand(
                            height: 100,
                            width: 600,
                          ),
                          fillColor: HexColor("#cbc2ae"),
                          hintText: "Confirm Password",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                    ),
                    Container(
                      width: 150,
                      height: 50,
                      child: MaterialButton(
                        textColor: Colors.black,
                        onPressed: () async {
                          await signup();

                          if (x == true) {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.SUCCES,
                              animType: AnimType.BOTTOMSLIDE,
                              width: 500,
                              title: 'Account successfully created',
                            )..show();
                          }
                        },
                        child: Text("Account Aanmaken"),
                        color: HexColor("#A1813D"),
                      ),
                    ),
                    Container(
                        child: Row(children: [
                          
                      FloatingActionButton.small( 
                        
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
                        backgroundColor: HexColor("#A1813D"),
                        child: Icon(Icons.arrow_back, color: Colors.black,),
                      ),
                    ]))
                  ])),
            )
          ],
        ),
      ),
    ));
  }
}
