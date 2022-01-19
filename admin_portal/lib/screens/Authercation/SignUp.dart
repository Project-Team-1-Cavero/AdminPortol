import 'package:admin_portal/screens/Authercation/uthercationscreen.dart';
import 'package:admin_portal/screens/Home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: duplicate_import
import 'package:admin_portal/screens/Home/home_page.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:hexcolor/hexcolor.dart';

class Sign_Up extends StatefulWidget {
  Sign_Up({Key? key}) : super(key: key);
  @override
  _Sign_UpState createState() => _Sign_UpState();
}
// deze class maakt nieuwe account aan en sla het op in de firebase
class _Sign_UpState extends State<Sign_Up> {
  late var MyPassword, MyEmail;
  late var x = false;
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  GlobalKey<FormState> FS = new GlobalKey<FormState>();
  signupFunc() async {
    var F_Data = FS.currentState;
    if (F_Data!.validate()) {
      F_Data.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: MyEmail, password: MyPassword);
        x = true;

        return userCredential;

      } on FirebaseAuthException catch (e) {
        // er verschijnt een melding wanneer de gebruiker een zwak wachtwoord invoert,
        // of als hij een account heeft op het zelfde email
        if (e.code == 'weak-password') {
          AwesomeDialog(
            context: context,
            title: 'Het opgegeven wachtwoord is te zwak.',
            width: 500,
          )..show();

          ;
        } else if (e.code == 'email-already-in-use') {
          AwesomeDialog(
            context: context,
            title: "Er bestaat al een account voor die email.",
            width: 500,
          )..show();
        }
      } catch (e) {
        print(e);
      }
    } else {}
  }

  @override
  //interface nieuwe account aanmaken pagina
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
                // logo de loods
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
                  key: FS,
                  child: Column(children: [
                    SizedBox(
                      height: 30,
                    ),
                    // email invoerveld
                    TextFormField(
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Graag email adres opgeven.";
                        }

                        return null;
                      },
                      // sla de waarde op die door de gebruiker is ingevoerd in de MyEmail variable
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
                    // wachtwoord invoerveld
                    TextFormField(
                      controller: password,
                      obscureText: true,
                      //sla de waarde op die door de gebruiker is ingevoerd in de MyPassword variable
                      onSaved: (val) {
                        MyPassword = val;
                      },
                      decoration: InputDecoration(
                          filled: true,
                          constraints:
                              BoxConstraints.tight(const Size(600, 50)),
                          fillColor: HexColor("#cbc2ae"),
                          hintText: "Wachtwoord",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                    ),
                    SizedBox(height: 30),
                    // wachtwoord opnieuw invoerveld
                    TextFormField(
                      controller: confirmpassword,
                      obscureText: true,
                      validator: (String? value) {
                        if (password.text != confirmpassword.text) {
                          return "De wachtwoorden komen niet overeen. Probeer opnieuw.";
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
                          hintText: "Wachtwoord opnieuw",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                    ),
                    Container(
                      width: 150,
                      height: 50,
                      child: MaterialButton(
                        textColor: Colors.black,
                        onPressed: () async {
                          await signupFunc();

                          if (x == true) {
                            // er verschijnt een melding wanneer het aanmaken van een account is gelukt,
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.SUCCES,
                              animType: AnimType.BOTTOMSLIDE,
                              width: 500,
                              title: 'Account succesvol aangemaakt!',
                            )..show();
                          }
                        },
                        child: Text("Account Aanmaken"),
                        color: HexColor("#A1813D"),
                      ),
                    ),
                    // terug-knop naar de vorige pagina
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
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
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
