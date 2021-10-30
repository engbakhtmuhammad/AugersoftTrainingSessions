// import 'package:flutter/material.dart';

// import 'listview.dart';
// class DynamicList extends StatefulWidget {
//   const DynamicList({ Key? key }) : super(key: key);

//   @override
//   _DynamicListState createState() => _DynamicListState();
// }

// class DyanmicList extends State<DynamicList> {List<String> litems = [];final TextEditingController eCtrl = new TextEditingController();@overrideWidget build (BuildContext ctxt) {return new Scaffold(appBar: new AppBar(title: new Text("Dynamic Demo"),),body: new Column(children: <Widget>[new TextField(controller: eCtrl,onSubmitted: (text) {litems.add(text);eCtrl.clear();setState(() {});},),new Expanded(child: new ListView.builder(itemCount: litems.length,itemBuilder: (BuildContext ctxt, int Index) {return new Text(litems[Index]);}))],));}}

