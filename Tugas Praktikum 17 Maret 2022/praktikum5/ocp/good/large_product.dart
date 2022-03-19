import 'product_delivery.dart';

class LargeProduct extends ProductDelivery {
  
  LargeProduct(int? price, String? name) : super(price, name);

  @override
  int calculateDelivery() {
    return this.price! + 1000;
  }
  
}