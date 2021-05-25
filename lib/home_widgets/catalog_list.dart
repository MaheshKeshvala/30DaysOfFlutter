import 'package:demo_ch_1/home_widgets/add_to_cart.dart';
import 'package:demo_ch_1/models/appdata.dart';
import 'package:demo_ch_1/pages/home_detail.dart';
import 'package:demo_ch_1/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'item_image.dart';

class ListOfItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20.0),
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
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: AppDataModel.items.length,
            itemBuilder: (context, index) {
              var item = AppDataModel.items[index];
              return InkWell(
                child: CataLogItem(item: item),
                onTap: () {
                  context.vxNav.push(
                      Uri(
                        path: MyRoutes.homeDetails,
                        queryParameters: {"id": item.id.toString()},
                      ),
                      params: item);
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
    var children2 = [
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
              item.name.text.xl.color(context.accentColor).bold.make(),
              item.desc.text.lg.textStyle(context.captionStyle).make(),
              8.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: Vx.mH8,
                children: [
                  "\$${item.price}".text.bold.xl.make(),
                  AddtoCart(item: item)
                ],
              ),
            ],
          ).p(context.isMobile ? 0 : 16),
        ),
      ),
    ];
    return VxBox(
      child: context.isMobile
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children2,
            )
          : Column(children: children2),
    ).color(context.cardColor).roundedLg.square(150).make().py12();
  }
}
