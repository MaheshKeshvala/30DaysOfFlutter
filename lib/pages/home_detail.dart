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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: Vx.mH8,
          children: [
            "\$${item.price}".text.red800.bold.xl4.make(),
            ElevatedButton(
              onPressed: () {},
              child: "Add to cart".text.make(),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.theme.buttonColor),
                shape: MaterialStateProperty.all(StadiumBorder()),
              ),
            ).wh(120, 50),
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
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      item.name.text.xl4.color(context.accentColor).bold.make(),
                      item.desc.text.xl.textStyle(context.captionStyle).make(),
                      8.heightBox,
                      "Erat aliquyam at no invidunt sit et no. Amet aliquyam labore no dolores dolor amet. Eirmod ipsum consetetur erat sadipscing magna diam est ipsum dolore.."
                          .text
                          .textStyle(context.captionStyle)
                          .make()
                          .p16()
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
