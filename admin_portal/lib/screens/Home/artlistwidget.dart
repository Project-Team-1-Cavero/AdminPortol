import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class artListWidget extends StatefulWidget {
  final QueryDocumentSnapshot<Object?> artpiece;

  artListWidget(this.artpiece);

  @override
  _artListWidgetState createState() => _artListWidgetState();
}

//Deze class bouwt een item in de lijst met kunstwerken
class _artListWidgetState extends State<artListWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: MediaQuery.of(context).size.height / 10,
        width: MediaQuery.of(context).size.width / 1.25,
        child: Expanded(
          child: Row(
            children: [
              //Linkerzijde
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                height: MediaQuery.of(context).size.height / 7.5,
                width: MediaQuery.of(context).size.width / 3.5,
                child: Row(children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 75,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Titel van het kunstwerk met het jaar ernaast tussen haakjes
                              Container(
                                height:
                                    MediaQuery.of(context).size.height / 300,
                              ),
                              Text(
                                widget.artpiece["Name"] +
                                    " (" +
                                    widget.artpiece["Year"] +
                                    ")",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 24),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                softWrap: false,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          //Kunstenaar
                          height: MediaQuery.of(context).size.height / 50,
                        ),
                        Text(
                          widget.artpiece["Artiest"],
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              Container(
                  //middenpunt
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(children: [
                        //Likes en dislikes
                        Column(
                          children: [
                            Icon(
                              Icons.thumb_up,
                              color: Colors.black,
                              size: 20.0,
                            ),
                            Text(
                              widget.artpiece["Likes"].toString(),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Icon(
                              Icons.thumb_down,
                              color: Colors.black,
                              size: 20.0,
                            ),
                            Text(
                              widget.artpiece["Dislikes"].toString(),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ]))),
              SizedBox(width: 10),
              Container(
                //rechterzijde
                decoration: const BoxDecoration(color: Colors.white),
                child: Row(children: [
                  //Tools
                  IconButton(
                    icon: Icon(Icons.qr_code),
                    color: Colors.black,
                    iconSize: 40.0,
                    tooltip: "Genereer QR code",
                    onPressed: () {
                      //QR code functie
                      qrDialog();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    color: Colors.black,
                    iconSize: 40.0,
                    tooltip: "Verwijderen",
                    onPressed: () {
                      //Delete functie
                      widget.artpiece.reference.delete();
                      setState(() {});
                    },
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future qrDialog() => showDialog( // deze functie zorgt voor het pop up scherm met een qr code vn een kunstwerk
      context: this.context,
      builder: (context) {
        return Center(
          child: Container(
            decoration: BoxDecoration(// achtergrond van het pop up  scherm (vorm en groote)
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            height: 350,
            child: Column(
              children: [
                Text(//titel van het pop up scherm
                  widget.artpiece["Name"],
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(//lege ruimte tussen titel en qr-image
                  height: 20,
                ),
                QrImage(//qr-image aanmaken 
                  data: widget.artpiece["Name"],//data in qr code
                  version: QrVersions.auto,
                  size: 300,// groote van qr code
                )
              ],
            ),
          ),
        );
      });
}
