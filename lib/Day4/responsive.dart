
import 'package:flutter/material.dart';


class ResponsivePage extends StatefulWidget {
  const ResponsivePage({ Key? key }) : super(key: key);

  @override
  _ResponsivePageState createState() => _ResponsivePageState();
}

class _ResponsivePageState extends State<ResponsivePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
            height: size.height*.1,
            width: size.width*.8,
            decoration: BoxDecoration(
              color: Colors.blue[100]
              ,borderRadius: BorderRadius.circular(25)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  labelText: "Eneter something"
                ),

              ),
            ),
        ),
          ),Container(
          height: size.height*.4,
          width: size.width*.6,
          color: Colors.green,
        )
        ],),
      ),
    );
  }
}
