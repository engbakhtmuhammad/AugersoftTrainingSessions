
import 'package:flutter/material.dart';

class ListDisplay extends StatelessWidget {
  List<String> litems = ["1","2","Third","4"];
  @override
  Widget build (BuildContext ctxt) {
    TextEditingController eCtrl = TextEditingController();
    return new Scaffold(
      appBar: new AppBar(title: new Text("Dynamic Demo"),),
      body: ListView.builder
  (
    itemCount: litems.length,
    itemBuilder: (BuildContext ctxt, int index) {
     return new Text(litems[index]);
    }
      ),
    );
  }
}