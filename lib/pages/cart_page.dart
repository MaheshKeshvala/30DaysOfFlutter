import 'package:demo_ch_1/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "My Cart".text.make(),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
    );
  }
}
