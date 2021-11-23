
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crud/DAY10/augersoft.dart';
import 'package:firebase_crud/Day5/userAction.dart';
import 'package:firebase_crud/Day7/callsPage.dart';
import 'package:firebase_crud/Day7/navigationPage.dart';
import 'package:flutter/material.dart';

import 'Day3/gridView.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Day5(),
    );
  }
}
