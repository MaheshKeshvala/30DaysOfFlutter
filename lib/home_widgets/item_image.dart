import 'package:demo_ch_1/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

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
