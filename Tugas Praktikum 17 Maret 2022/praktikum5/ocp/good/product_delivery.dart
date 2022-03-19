abstract class ProductDelivery {
  int? price;
  String? name;

  ProductDelivery(this.price, this.name);

  int calculateDelivery();
}