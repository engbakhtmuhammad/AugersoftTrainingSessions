import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCard extends StatelessWidget {
  final QuerySnapshot snapshot;
  final int index;

  const CustomCard({Key? key, required this.snapshot, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var timeToDate = new DateTime.fromMillisecondsSinceEpoch(
    //     snapshot.docs[index]["timestamp"].seconds * 1000);
    // var dateFormatted = new DateFormat("EEEE, MMM d").format(timeToDate);
    //snapshot.documents[index].data["description"]
    var snapshotData = snapshot.docs[index];
    var docId = snapshot.docs[index].id;

    TextEditingController nameInputController =
        new TextEditingController(text: snapshotData['name']);
    TextEditingController descriptionInputController =
        new TextEditingController(text: snapshotData['description']);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 140,
          child: Card(
            elevation: 9,
            child: Column(
              children: [
                ListTile(
                  title: Text(snapshotData['name']),
                  subtitle: Text(snapshotData["description"]),
                  leading: CircleAvatar(
                    radius: 34,
                    child: Text(snapshotData['name'][0]),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Text("By: ${snapshotData["name"]} "),
                //       Text(dateFormatted),
                //     ],
                //   ),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        icon: Icon(
                          FontAwesomeIcons.edit,
                          size: 15,
                        ),
                        onPressed: () async {
                          await showDialog(
                              builder: (context) => AlertDialog(
                                    contentPadding: EdgeInsets.all(10),
                                    content: Column(
                                      children: [
                                        Text("Please fill out the form"),
                                        TextField(
                                          autofocus: true,
                                          autocorrect: true,
                                          decoration: InputDecoration(
                                          labelText: "Your Name*"),
                                          controller: nameInputController,
                                        
                                        ),
                                        TextField(
                                          autofocus: true,
                                          autocorrect: true,
                                          decoration: InputDecoration(
                                          labelText: "Description*"),
                                          controller:
                                          descriptionInputController,
                                        )
                                      ],
                                    ),
                                    actions: [
                                      FlatButton(
                                        onPressed: () {
                                          nameInputController.clear();
                                          descriptionInputController.clear();
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel"),
                                      ),
                                      FlatButton(
                                          onPressed: () {
                                            if (
                                                nameInputController
                                                    .text.isNotEmpty &&
                                                descriptionInputController
                                                    .text.isNotEmpty) {
                                              FirebaseFirestore.instance
                                                  .collection("augersoft")
                                                  .doc(docId)
                                                  .update({
                                                "name":
                                                    nameInputController.text,
                                                "description":
                                                    descriptionInputController
                                                        .text,
                                                "timestamp": new DateTime.now()
                                              }).then((value) {
                                                Navigator.pop(context);
                                              });         (error) => print(error);
                                            }
                                          },
                                          child: Text("Update"))
                                    ],
                                  ),
                              context: context);
                        }),
                    SizedBox(
                      height: 19,
                    ),
                    IconButton(
                        icon: Icon(
                          FontAwesomeIcons.trashAlt,
                          size: 15,
                        ),
                        onPressed: () async {
                          print(docId);
                          var CollectionReference =
                              FirebaseFirestore.instance.collection("augersoft");
                          await CollectionReference.doc(docId).delete();
                        }),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
