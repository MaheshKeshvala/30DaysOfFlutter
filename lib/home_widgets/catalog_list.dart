import 'package:demo_ch_1/models/appdata.dart';
import 'package:demo_ch_1/pages/home_detail.dart';
import 'package:demo_ch_1/utils/routes.dart';
import 'package:demo_ch_1/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'item_image.dart';

class ListOfItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: AppDataModel.items.length,
      itemBuilder: (context, index) {
        var item = AppDataModel.items[index];
        return InkWell(
          child: CataLogItem(item: item),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeDetails(item: item),
              ),
            );
          },
        );
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
          Hero(
            tag: Key(item.id.toString()),
            child: ItemImage(
              item: item.image,
            ),
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
                        child: "Add to cart".text.make(),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              MyTheme.darkBluishColor),
                          shape: MaterialStateProperty.all(StadiumBorder()),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ).white.roundedLg.square(150).make().py12();
  }
}
