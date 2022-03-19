import 'product_delivery.dart';

void main(List<String> args) {
  var product = ProductDelivery(12000, "PopCorn");
  print(product.calculateDelivery("Medium"));
}