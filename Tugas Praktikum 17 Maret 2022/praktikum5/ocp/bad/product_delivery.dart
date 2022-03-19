class ProductDelivery {
  int? price;
  String? name;

  ProductDelivery(this.price, this.name);

  int calculateDelivery(String type) {
    switch (type) {
      case "Larger":
        return this.price! + 1000;
      case "Medium":
        return this.price! + 500;
      default:
        return this.price! + 100;
    }
  }
}