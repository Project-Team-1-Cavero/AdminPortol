import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class artListWidget extends StatefulWidget {
  final QueryDocumentSnapshot<Object?> artpiece;

  artListWidget(this.artpiece);

  @override
  _artListWidgetState createState() => _artListWidgetState();
}

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
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(children: [
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
                decoration: const BoxDecoration(color: Colors.white),
                child: Row(children: [
                  IconButton(
                    icon: Icon(Icons.qr_code),
                    color: Colors.black,
                    iconSize: 40.0,
                    tooltip: "Generate QR code",
                    onPressed: () {
                      //QR code functie
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    color: Colors.black,
                    iconSize: 40.0,
                    tooltip: "Delete",
                    onPressed: () {
                      //Delete functie
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
}
