
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'cardWidget.dart';

class AugersoftDB extends StatefulWidget {
  @override
  _AugersoftDBState createState() => _AugersoftDBState();
}

class _AugersoftDBState extends State<AugersoftDB> {
  var firestoreDb = FirebaseFirestore.instance.collection("augersoft").snapshots();
  TextEditingController nameInputController=  TextEditingController();

  TextEditingController descriptionInputController=  TextEditingController();

  @override
  void initState() {
    super.initState();
    nameInputController = new TextEditingController();
    descriptionInputController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Team Members"),
      ),
      body: StreamBuilder(
        stream: firestoreDb,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
          return ListView.builder(
              itemCount: snapshot.data!.size,
              itemBuilder: (context, int index) {
                return CustomCard(snapshot: snapshot.data!, index: index);
                // return Text(snapshot.data.documents[index]['description']);
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog(context);
        },
        child: Icon(Icons.add_outlined),
      ),
    );
  }

  _showDialog(BuildContext context) async {
    await showDialog(
        builder: (context) => AlertDialog(
          
              contentPadding: EdgeInsets.all(10),
              content: Column(
                children: [
                  Text("Please fill out the form"),
                  TextField(
                    autofocus: true,
                    autocorrect: true,
                    decoration: InputDecoration(labelText: "Your Name*"),
                    controller: nameInputController,
                  
                  ),
                  TextField(
                    autofocus: true,
                    autocorrect: true,
                    decoration: InputDecoration(labelText: "Description*"),
                    controller: descriptionInputController,
                  )
                ],
              ),
          actions: [
            FlatButton(
              onPressed: (){
                  nameInputController.clear();
                  descriptionInputController.clear();
                  Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            FlatButton(onPressed: (){
              if( nameInputController.text.isNotEmpty && descriptionInputController.text.isNotEmpty){
                FirebaseFirestore.instance.collection("augersoft").add({
                  "name":nameInputController.text,
                  "description" : descriptionInputController.text,
                  "timestamp": new DateTime.now()
                }).then((response) {
                  print(response.id);
                  Navigator.pop(context);
                  nameInputController.clear();
                  descriptionInputController.clear();

                }).catchError((error) => print(error));
              }
            }, child: Text("Save"))
          ],
            ),
        context: context);
  }
}