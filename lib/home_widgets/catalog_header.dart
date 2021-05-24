import 'package:demo_ch_1/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

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
