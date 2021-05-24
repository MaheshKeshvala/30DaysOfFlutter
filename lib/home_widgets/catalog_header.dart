import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CataLogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl4.color(context.theme.accentColor).make(),
        "Trending products".text.xl2.make()
      ],
    );
  }
}
