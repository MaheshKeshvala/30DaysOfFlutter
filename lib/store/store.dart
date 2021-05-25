import 'package:demo_ch_1/models/appdata.dart';
import 'package:demo_ch_1/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  AppDataModel appdataModel;
  CartModel cartModel;

  MyStore() {
    appdataModel = AppDataModel();
    cartModel = CartModel();
    cartModel.appData = appdataModel;
  }
}
