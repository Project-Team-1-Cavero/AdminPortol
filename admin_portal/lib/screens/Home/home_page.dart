import 'package:admin_portal/screens/Authercation/uthercationscreen.dart';
import 'package:admin_portal/screens/Home/addwidget.dart';
import 'package:admin_portal/screens/Home/artlist.dart';
import 'package:admin_portal/screens/Home/database_logic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:admin_portal/screens/Authercation/SignUp.dart';
import 'package:hexcolor/hexcolor.dart';

class homePage extends StatefulWidget {
  homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  String pageType = "list";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10),
              width: MediaQuery.of(context).size.width / 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 30, bottom: 20),
                    child: Text(
                      "Welkom",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(color: HexColor("#A1813D")),
                        child: MaterialButton(
                          //Verander pagetype naar "add"
                          onPressed: () => setState(() => pageType = "add"),
                          child: Text("Voeg een\nkunstwerk toe"),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(color: HexColor("#A1813D")),
                        child: MaterialButton(
                          //Verander pagetype naar "list"
                          onPressed: () => setState(() => pageType = "list"),
                          child: Text("Lijst van\nkunstwerken"),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(color: HexColor("#A1813D")),
                        child: MaterialButton(
                            child: Text("Maak nieuwe admin aan"),
                            onPressed: () async {
                              try {
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Sign_Up()));
                              } catch (e) {
                                print(e.toString());
                                ;
                              }
                            }),
                      ),
                      SizedBox(
                        height: 180,
                      ),
                      // uitloggen knop
                      Container(
                        child: FloatingActionButton.small(
                          onPressed: () async {
                            await FirebaseAuth.instance.signOut();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AuthercationScreen()));
                          },
                          backgroundColor: HexColor("#A1813D"),
                          child: Icon(
                            Icons.logout,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: 50,
            ),
            Container(
                width: MediaQuery.of(context).size.width / 2,
                padding: EdgeInsets.only(top: 20),
                //Verandert widget aan de hand van pagetype
                child: (pageType == "list") ? artList() : addDataWidget())
          ],
        ),
      ),
    ));
  }
}
