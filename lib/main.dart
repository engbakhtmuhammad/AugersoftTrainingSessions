
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crud/DAY10/augersoft.dart';
import 'package:firebase_crud/RestAPIs/screen/show_data.dart';
import 'package:flutter/material.dart';

import 'Day3/gridView.dart';
import 'Day6/listview.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: AugersoftDB(),
      home: ShowData(),
    );
  }
}
