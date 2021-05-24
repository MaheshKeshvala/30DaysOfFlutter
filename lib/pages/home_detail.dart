import 'package:demo_ch_1/models/appdata.dart';
import 'package:demo_ch_1/widgets/themes.dart';
import 'package:flutter/material.dart';
import "package:velocity_x/velocity_x.dart";

class HomeDetails extends StatelessWidget {
  final Item item;

  const HomeDetails({Key key, @required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Vx.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: Vx.mH8,
          children: [
            "\$${item.price}".text.red800.bold.xl4.make(),
            ElevatedButton(
              onPressed: () {},
              child: "Buy".text.make(),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(MyTheme.darkBluishColor),
                shape: MaterialStateProperty.all(StadiumBorder()),
              ),
            ).wh(100, 50),
          ],
        ).p20(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(item.id.toString()),
              child: Image.network(item.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      item.name.text.xl4
                          .color(MyTheme.darkBluishColor)
                          .bold
                          .make(),
                      item.desc.text.xl.textStyle(context.captionStyle).make(),
                      8.heightBox,
                    ],
                  ).py64(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
