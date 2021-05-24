import 'dart:convert';

import 'package:demo_ch_1/models/appdata.dart';
import 'package:demo_ch_1/widgets/drawer.dart';
import 'package:demo_ch_1/widgets/themes.dart';
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
        backgroundColor: MyTheme.creamColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CataLogHeader(),
                if (AppDataModel.items != null && AppDataModel.items.isNotEmpty)
                  ListOfItem().expand()
                else
                  Center(
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          ),
        ));
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

class ListOfItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: AppDataModel.items.length,
      itemBuilder: (context, index) {
        var item = AppDataModel.items[index];
        return CataLogItem(item: item);
      },
    );
  }
}

class CataLogItem extends StatelessWidget {
  final Item item;
  const CataLogItem({Key key, @required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ItemImage(
            item: item.image,
          ),
          Expanded(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  item.name.text.xl.color(MyTheme.darkBluishColor).bold.make(),
                  item.desc.text.lg.textStyle(context.captionStyle).make(),
                  8.heightBox,
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: Vx.mH8,
                    children: [
                      "\$${item.price}".text.bold.xl.make(),
                      ElevatedButton(
                        onPressed: () {},
                        child: "Buy".text.make(),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              MyTheme.darkBluishColor),
                          shape: MaterialStateProperty.all(StadiumBorder()),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ).white.roundedLg.square(160).make().py12();
  }
}

class CataLogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl4.color(MyTheme.darkBluishColor).make(),
        "Trending products".text.xl2.make()
      ],
    );
  }
}

class ItemImage extends StatelessWidget {
  final String item;
  const ItemImage({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        item,
      ).box.rounded.p8.color(MyTheme.creamColor).make().p16().w40(context),
    );
  }
}
