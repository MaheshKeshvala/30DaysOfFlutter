import 'package:demo_ch_1/models/cart.dart';
import 'package:demo_ch_1/widgets/item_widgets.dart';
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
      backgroundColor: context.canvasColor,
      body: Column(
        children: [
          CartListState().p16().expand(),
          Divider(),
          CartTotal(),
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  final cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "Total : \$${cart.totalPrice}"
              .text
              .color(context.theme.accentColor)
              .xl3
              .make(),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: "Buying not supported yet..".text.make(),
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(context.theme.buttonColor),
            ),
            child: "Buy".text.color(context.theme.buttonColor).make(),
          ).w32(context),
        ],
      ),
    );
  }
}

class CartListState extends StatefulWidget {
  const CartListState({Key key}) : super(key: key);

  @override
  _CartListStateState createState() => _CartListStateState();
}

class _CartListStateState extends State<CartListState> {
  final cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return cart.items.isEmpty
        ? Center(
            child: "Your cart is empty".text.xl4.bold.make(),
          )
        : ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {
                  setState(() {});
                  cart.removeItem(
                    cart.items[index],
                  );
                  setState(() {});
                },
              ),
              title: cart.items[index].name.text.make(),
            )
            /* ItemWidget(
              item: cart.items[index],
            ) */
            ,
          );
  }
}
