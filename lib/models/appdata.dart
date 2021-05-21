class AppDataModel {
  static final items = [
    Item(
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc",
        name: "On Cloud Nine Pillow",
        price: 24.99,
        productId: 7631,
        productUrl: "https://www.domain.com/product/heh-9133",
        retailPrice: 24.99,
        sku: "HEH-9133")
  ];
}

class Item {
  final num productId;
  final String sku;
  final String name;
  final String productUrl;
  final num price;
  final num retailPrice;
  final String imageUrl;

  Item(
      {this.productId,
      this.sku,
      this.name,
      this.productUrl,
      this.price,
      this.retailPrice,
      this.imageUrl});
}
