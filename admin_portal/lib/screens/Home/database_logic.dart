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
  .child(ImageLocation)
  .getDownloadURL();

}
void uploadImages({required Function(File file) Selected}){
  var imageInput = FileUploadInputElement()..accept = 'image/*';     //dit zorgt ervoor dat je alleen maar foto's kan uploaden
  imageInput.click();

  imageInput.onChange.listen((event) {
    var file = imageInput.files!.first;
    var fileReader = FileReader();
    fileReader.readAsDataUrl(file);
    fileReader.onLoadEnd.listen((event) {
      Selected(file);
    });
  });
  }
  void uploadToFbStorage(String artname, String artist){
    
    uploadImages(
      Selected: (file){
    firebase.storage()
    .refFromURL('gs://caveroartgallerytrip.appspot.com')   //locatie van firebase 
    .child(artist + artname)                               //locatie van de foto/jpeg file aan maken
    .put(file);                                            //upload foto naar de juiste locatie
    },);

  }