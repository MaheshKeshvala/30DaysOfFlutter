import 'package:demo_ch_1/store/store.dart';
import 'package:velocity_x/velocity_x.dart';

import 'appdata.dart';

class CartModel {
  AppDataModel dataModel;

  final List<int> itemIds = [];

  AppDataModel get appData => dataModel;

  set appData(AppDataModel appDataModel) {
    assert(appDataModel != null);
    dataModel = appDataModel;
  }

  // List of cart items
  List<Item> get items =>
      itemIds.map((id) => dataModel.getItemById(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //Add item
  void addItem(Item item) {
    itemIds.add(item.id);
  }

  //Remove item
  void removeItem(Item item) {
    itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store.cartModel.itemIds.add(item.id);
  }
}
