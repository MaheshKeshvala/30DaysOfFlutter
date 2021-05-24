import 'dart:convert';

import 'package:demo_ch_1/home_widgets/catalog_header.dart';
import 'package:demo_ch_1/home_widgets/catalog_list.dart';
import 'package:demo_ch_1/models/appdata.dart';
import 'package:demo_ch_1/utils/routes.dart';
import 'package:demo_ch_1/widgets/drawer.dart';
import 'package:demo_ch_1/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

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
        title: "CataLog App".text.make(),
      ),
      backgroundColor: MyTheme.creamColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.cartRoute);
        },
        backgroundColor: MyTheme.darkBluishColor,
        child: Icon(CupertinoIcons.cart),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CataLogHeader(),
              if (AppDataModel.items != null && AppDataModel.items.isNotEmpty)
                ListOfItem().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
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
