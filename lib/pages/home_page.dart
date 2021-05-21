import 'dart:convert';

import 'package:demo_ch_1/models/appdata.dart';
import 'package:demo_ch_1/widgets/drawer.dart';
import 'package:demo_ch_1/widgets/item_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(10, (index) => AppDataModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catalog App",
        ),
      ),
      body: Material(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: dummyList.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                item: dummyList[index],
              );
            },
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }

  void loadData() async {
    final appJson = await rootBundle.loadString("assets/files/app_data.json");
    final decodeData = jsonDecode(appJson);
    var productsData = decodeData["products"];
    print(productsData);
  }
}
