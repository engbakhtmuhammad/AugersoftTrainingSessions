import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('Entry A')),
          ),
          Container(
            height: 50,
            color: Colors.amber[500],
            child: const Center(child: Text('Entry B')),
          ),
          Container(
            height: 50,
            color: Colors.amber[400],
            child: const Center(child: Text('Entry C')),
          ),
          Container(
            height: 50,
            color: Colors.amber[300],
            child: const Center(child: Text('Entry D')),
          ),
          Container(
            height: 50,
            color: Colors.amber[200],
            child: const Center(child: Text('Entry E')),
          ),
        ],
      ),
    );
  }
}
