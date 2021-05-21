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

  final products = [
    Item(
        imageUrl: "https://www.domain.com/images/heh-9133_600x600.png",
        name: "On Cloud Nine Pillow",
        price: 24.99,
        productId: 7631,
        productUrl: "https://www.domain.com/product/heh-9133",
        retailPrice: 24.99,
        sku: "HEH-9133")
  ];
}
