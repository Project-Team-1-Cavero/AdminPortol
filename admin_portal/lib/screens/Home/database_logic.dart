import 'dart:html';
//import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase.dart' as firebase;
import 'package:flutter/material.dart';
import 'dart:async';
//import 'package:universal_html/prefer_universal/html.dart' as html;

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
Future<Uri> dowmloadURL(String ImageLocation){
  return firebase.storage()
  .refFromURL('gs://caveroartgallerytrip.appspot.com')
  .child('')
  .getDownloadURL();

}
void uploadImage({required Function(File file) Selected}){
  var uploadInput = FileUploadInputElement()..accept = 'image/*';     //dit zorgt ervoor dat je alleen maar foto's kan uploaden
  uploadInput.click();

  uploadInput.onChange.listen((event) {
    final file = uploadInput.files!.first;
    final reader = FileReader();
    reader.readAsDataUrl(file);
    reader.onLoadEnd.listen((event) {
      Selected(file);
    });
  });
  }
  void uploadToStorage(){
    
    uploadImage(
      Selected: (file){
    firebase.storage()
    .refFromURL('gs://caveroartgallerytrip.appspot.com')   //locatie van firebase 
    .child(file.name)                                      //locatie van de foto/jpeg file
    .put(file);                                            //upload foto naar de juiste locatie
    },);

  }