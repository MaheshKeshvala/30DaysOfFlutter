import 'appdata.dart';

class CartModel {
  static final cartmodel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartmodel;

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
