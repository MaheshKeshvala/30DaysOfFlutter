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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catalog App",
        ),
      ),
      body: Material(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: AppDataModel.items != null && AppDataModel.items.isNotEmpty
              ? ListView.builder(
                  itemCount: AppDataModel.items.length,
                  itemBuilder: (context, index) => ItemWidget(
                    item: AppDataModel.items[index],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }

  void loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final appJson = await rootBundle.loadString("assets/files/app_data.json");
    final decodeData = jsonDecode(appJson);
    var productsData = decodeData["products"];
    AppDataModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }
}
