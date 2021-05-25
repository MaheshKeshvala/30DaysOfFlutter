import 'dart:convert';

import 'package:demo_ch_1/home_widgets/catalog_header.dart';
import 'package:demo_ch_1/home_widgets/catalog_list.dart';
import 'package:demo_ch_1/models/appdata.dart';
import 'package:demo_ch_1/models/cart.dart';
import 'package:demo_ch_1/store/store.dart';
import 'package:demo_ch_1/utils/routes.dart';
import 'package:demo_ch_1/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    final cart = (VxState.store as MyStore).cartModel;
    return Scaffold(
      appBar: AppBar(
        title: "CataLog App".text.make(),
      ),
      backgroundColor: Theme.of(context).canvasColor,
      floatingActionButton: VxBuilder(
        builder: (context, _, __) => FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.cartRoute);
          },
          backgroundColor: context.theme.buttonColor,
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
          color: context.theme.accentColor,
          size: 20,
          count: cart.items.length,
          textStyle: TextStyle(color: context.theme.cardColor),
        ),
        mutations: {AddMutation, RemoveMutation},
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
    //await Future.delayed(Duration(seconds: 2));
    //final appJson = await rootBundle.loadString("assets/files/app_data.json");
    final response = await http.get(Uri.parse(url));
    final appJson = response.body;

    final decodeData = jsonDecode(appJson);
    var productsData = decodeData["products"];
    AppDataModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }
}
