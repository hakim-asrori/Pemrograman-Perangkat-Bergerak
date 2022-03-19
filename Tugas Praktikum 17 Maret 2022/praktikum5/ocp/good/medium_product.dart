import 'product_delivery.dart';

class MediumProduct extends ProductDelivery {
  
  MediumProduct(int? price, String? name) : super(price, name);

  @override
  int calculateDelivery() {
    return this.price! + 700;
  }
  
}