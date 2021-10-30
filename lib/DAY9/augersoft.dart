
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data!.docs[index]['name']),
                    subtitle: Text(snapshot.data!.docs[index]['description']),
),
                );
                // return Text(snapshot.data.documents[index]['description']);
              });
        },
      )
    );
  }

}