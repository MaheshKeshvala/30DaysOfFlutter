import 'package:demo_ch_1/models/appdata.dart';
import 'package:demo_ch_1/models/cart.dart';
import 'package:demo_ch_1/store/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:vxstate/vxstate.dart';

class AddtoCart extends StatelessWidget {
  final Item item;
  AddtoCart({Key key, @required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.listen(context, to: [AddMutation, RemoveMutation]);
    final CartModel cart = (VxState.store as MyStore).cartModel;
    bool isInCart = cart.items.contains(item) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (isInCart) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: "You have already added item".text.make(),
            ),
          );
        } else {
          AddMutation(item);
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
