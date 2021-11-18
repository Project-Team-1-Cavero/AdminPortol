import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> addArtPiece(String name, String info, String year, String artiest, String videoLink, String room, String buyLink) async{
  try {
    CollectionReference artPieces = FirebaseFirestore.instance.collection("ArtPieces");
    artPieces.add({
      "Name" : name,
      "Artiest" : artiest,
      "BuyLink" : buyLink,
      "Info" : info,
      "Room" : room,
      "VideoLink" : videoLink,
      "Year" : year,
      "Likes" : 0,
      "Dislikes" : 0
    });


    return true;
    
  } catch (e) {
    return false;
  }



}