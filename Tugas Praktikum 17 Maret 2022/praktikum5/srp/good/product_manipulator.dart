class ProductManipulator {
  double? price;
  String? name;

  ProductManipulator(this.price, this.name);

  void editPrice(double price) {
    this.price = price;
  }

  void editName(String name) {
    this.name = name;
  }
}