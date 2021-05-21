import 'package:demo_ch_1/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int day = 30;

  String name = "Techno";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catalog App",
        ),
      ),
      body: Material(
        child: Center(
          child: Container(
            child: Text("My First Flutter App $day by $name"),
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
