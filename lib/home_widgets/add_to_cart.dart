import 'package:demo_ch_1/models/appdata.dart';
import 'package:demo_ch_1/models/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddtoCart extends StatefulWidget {
  final Item item;
  const AddtoCart({Key key, @required this.item})
      : assert(item != null),
        super(key: key);

  @override
  _AddtoCartState createState() => _AddtoCartState();
}

class _AddtoCartState extends State<AddtoCart> {
  final cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = cart.items.contains(widget.item) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (isInCart) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: "You have already added item".text.make(),
            ),
          );
        } else {
          isInCart = isInCart.toggle();
          final appDataModel = AppDataModel();
          cart.appData = appDataModel;
          cart.addItem(widget.item);
          setState(() {});
        }
      },
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
    );
  }
}
