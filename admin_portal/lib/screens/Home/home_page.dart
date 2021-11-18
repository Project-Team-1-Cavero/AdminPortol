import 'package:admin_portal/screens/Home/addwidget.dart';
import 'package:admin_portal/screens/Home/database_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class homePage extends StatefulWidget {
  homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Colors.blue
        ),
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
                    child: Text("Welcome",
                      style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(color: Colors.green),
                        child: MaterialButton(
                          onPressed: () {},
                          child: Text("Add a\nArt piece "),
                        ),

                      ),
                      Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(color: Colors.green),
                        child: MaterialButton(
                          onPressed: () {},
                          child: Text("delete a\nArt piece "),
                        ),

                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              padding: EdgeInsets.only(top: 20),
              child: addDataWidget()
            )
          ],
        ),
      ),
    );
  }
}