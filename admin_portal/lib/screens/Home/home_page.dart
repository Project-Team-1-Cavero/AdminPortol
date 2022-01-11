import 'package:admin_portal/screens/Home/addwidget.dart';
import 'package:admin_portal/screens/Home/artlist.dart';
import 'package:admin_portal/screens/Home/database_logic.dart';
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 30, bottom: 20),
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(color: HexColor("#A1813D")),
                        child: MaterialButton(
                          onPressed: () => setState(() => pageType = "add"),
                          child: Text("Add an\nArt piece "),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(color: HexColor("#A1813D")),
                        child: MaterialButton(
                          onPressed: () => setState(() => pageType = "list"),
                          child: Text("List of\nArt pieces "),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(color: HexColor("#A1813D")),
                        child: MaterialButton(
                            child: Text("Add Account"),
                            onPressed: () async {
                              try {
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              } catch (e) {
                                print(e.toString());
                                ;
                              }
                            }),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width / 2,
                padding: EdgeInsets.only(top: 20),
                child: (pageType == "list") ? artList() : addDataWidget())
          ],
        ),
      ),
    );
  }
}
