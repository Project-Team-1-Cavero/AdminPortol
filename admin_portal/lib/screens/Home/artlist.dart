import 'package:admin_portal/screens/Home/artlistwidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class artList extends StatefulWidget {
  artList({Key? key}) : super(key: key);

  @override
  _artListState createState() => _artListState();
}

class _artListState extends State<artList> {
  //Art pieces data
  final Stream<QuerySnapshot> artPieces =
      FirebaseFirestore.instance.collection("ArtPieces").snapshots();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: StreamBuilder<QuerySnapshot>(
      stream: artPieces,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("There was a error");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final data = snapshot.requireData;

        return ListView.builder(
          itemCount: data.size,
          itemBuilder: (BuildContext context, int index) {
            if (data.docs[index] != null) {
              var artpiece = data.docs[index];
              return artListWidget(artpiece);
            }

            return Text("Something went wrong");
          },
        );
      },
    ));
  }
}
