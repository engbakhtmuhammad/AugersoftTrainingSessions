import 'dart:convert';

import 'package:firebase_crud/RestAPIs/model/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ShowData extends StatefulWidget {
  const ShowData({Key? key}) : super(key: key);

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  String url = 'https://jsonplaceholder.typicode.com/posts';
  List<Model> postList=[];
  Model model = Model();
  Future<List<Model>> getData() async {
    var response = await http.get(Uri.parse(url));
    var result = jsonDecode(response.body);
    for(Map<String, dynamic> i in result){
      setState(() {
        postList.add(Model.fromJson(i));
      });
    }
    print('This is output>>>>>>>>>>>>>>>>>>>>$postList');
    return postList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetching Data from API'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            return ListView.builder(
                  itemCount: postList.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(postList[index].title.toString()),
                    subtitle: Text(postList[index].body.toString()),
                  ));
          }),
    );
  }
}
