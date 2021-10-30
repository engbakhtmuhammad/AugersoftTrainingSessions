import 'package:flutter/material.dart';

class VisibleWidgetPage extends StatelessWidget {
  const VisibleWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("This is text widget"),
        Image.asset(
          'assets/images/San-Francisco.jpg',
          fit: BoxFit.cover,
        ),
        Icon(
          Icons.star,
          color: Colors.red[500],
        ),
      ]),
    );
  }
}
