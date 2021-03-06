import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'database_logic.dart';
//import 'package:firebase/firebase.dart';

class addDataWidget extends StatefulWidget {
  addDataWidget({Key? key}) : super(key: key);

  @override
  _addDataWidgetState createState() => _addDataWidgetState();
}

class _addDataWidgetState extends State<addDataWidget> {
  final TextEditingController _nameField = TextEditingController();
  final TextEditingController _infoField = TextEditingController();
  final TextEditingController _yearField = TextEditingController();
  final TextEditingController _artiestField = TextEditingController();
  final TextEditingController _roomField = TextEditingController();
  final TextEditingController _floorField = TextEditingController();
  final TextEditingController _buildField = TextEditingController();
  final TextEditingController _videoField = TextEditingController();
  final TextEditingController _buyField = TextEditingController();

  String textfield = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Add a new artpiece",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        TextField(
          controller: _nameField,
          decoration: const InputDecoration(label: Text("Naam")),
        ),
        TextField(
          controller: _infoField,
          decoration: const InputDecoration(label: Text("Info")),
        ),
        TextField(
          controller: _yearField,
          decoration: const InputDecoration(label: Text("Jaar")),
        ),
        TextField(
          controller: _artiestField,
          decoration: const InputDecoration(label: Text("Artiest")),
        ),
        TextField(
          controller: _roomField,
          decoration: const InputDecoration(label: Text("Kamer")),
        ),
        TextField(
          controller: _floorField,
          decoration: const InputDecoration(label: Text("Etage")),
        ),
        TextField(
          controller: _buildField,
          decoration: const InputDecoration(label: Text("Gebouw")),
        ),
        TextField(
          controller: _videoField,
          decoration: const InputDecoration(label: Text("Video link")),
        ),
        TextField(
          controller: _buyField,
          decoration: const InputDecoration(label: Text("Koop link")),
        ),
        Text(textfield),
        Row(
          children: [
            Container(
              width: 100,
              height: 35,
              decoration: BoxDecoration(color: HexColor("#A1813D")),
              child: MaterialButton(
                onPressed: () {
                  selectImages();
                },
                child: Text("Upload afbeelding"),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              width: 100,
              height: 35,
              decoration: BoxDecoration(color: HexColor("#A1813D")),
              child: MaterialButton(
                child: Text("Voeg toe"),
                onPressed: () async {
                  bool isAdded = await addArtPiece(
                      _nameField.text,
                      _infoField.text,
                      _yearField.text,
                      _artiestField.text,
                      _videoField.text,
                      _roomField.text,
                      _floorField.text,
                      _buildField.text,
                      _buyField.text);
                  uploadToFbStorage(_nameField.text, _artiestField.text);
                  if (isAdded) {
                    setState(() {
                      textfield = "Toegevoegd";
                    });
                  } else {
                    setState(() {
                      textfield = "Error";
                    });
                  }
                },
              ),
            )
          ],
        )
      ],
    );
  }
}
