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

  double calculatePPN() {
    return this.price! * 10 / 100;
  }
  
  double calculatePPH() {
    return this.price! * 0.25 / 100;
  }
}