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
              // Info container
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                height: MediaQuery.of(context).size.height / 7.5,
                width: MediaQuery.of(context).size.width / 1.55,
                child: Row(children: [
                  //Left space
                  Container(
                    width: MediaQuery.of(context).size.width / 75,
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Upper information
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height / 300,
                              ),
                              Text(
                                widget.artpiece["Name"],
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
                        //Lower information
                        Row(
                          children: [
                            //Artiest info
                            Column(
                              children: [
                                const Text(
                                  "ARTIEST",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  widget.artpiece["Artiest"],
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),

                            //inbetween
                            Container(
                              width: MediaQuery.of(context).size.width / 50,
                              height: MediaQuery.of(context).size.height / 30,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 125,
                              height: MediaQuery.of(context).size.height / 30,
                              decoration: BoxDecoration(color: Colors.grey),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 50,
                              height: MediaQuery.of(context).size.height / 30,
                            ),

                            //jaar info
                            Column(
                              children: [
                                const Text(
                                  "JAAR",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  widget.artpiece["Year"],
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),

                            //inbetween
                            Container(
                              width: MediaQuery.of(context).size.width / 50,
                              height: MediaQuery.of(context).size.height / 30,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 125,
                              height: MediaQuery.of(context).size.height / 30,
                              decoration: BoxDecoration(color: Colors.grey),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 50,
                              height: MediaQuery.of(context).size.height / 30,
                            ),

                            //Ruimte info
                            Column(
                              children: [
                                const Text(
                                  "RUIMTE",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  widget.artpiece["Room"],
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
