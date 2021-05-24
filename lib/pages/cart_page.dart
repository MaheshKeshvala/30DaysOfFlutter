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
          CartListState().p32().expand(),
          Divider(),
          CartTotal(),
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "Total : \$${999}".text.color(context.theme.accentColor).xl3.make(),
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

class CartListState extends StatelessWidget {
  const CartListState({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: () {},
        ),
        title: "Text List1".text.make(),
      ),
    );
  }
}
