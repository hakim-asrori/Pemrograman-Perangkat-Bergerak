import 'product_delivery.dart';

class SmallProduct extends ProductDelivery {
  
  SmallProduct(int? price, String? name) : super(price, name);

  @override
  int calculateDelivery() {
    return this.price! + 500;
  }
  
}