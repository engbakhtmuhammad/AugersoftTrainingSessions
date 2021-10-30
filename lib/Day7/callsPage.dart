
import 'package:firebase_crud/Day7/Tabar.dart';
import 'package:flutter/material.dart';

class CallsPage extends StatelessWidget {
  const CallsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                tabs: [
                  Tab(
                    text: 'Incoming',
                  ),
                  Tab(
                    text: 'Outgoing',
                  ),
                  Tab(
                    text: 'Missed',
                  ),
                ],
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            IncomingPage(),
            OutgoingPage(),
            MissedPage(),
          ],
        ),
      ),
    );
  }
}
