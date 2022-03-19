import 'large_product.dart';
import 'medium_product.dart';
import 'small_product.dart';

void main(List<String> args) {
  LargeProduct largeProduct1 = new LargeProduct(12000, "PopCorn");
  print(largeProduct1.calculateDelivery());
  MediumProduct mediumProduct1 = new MediumProduct(10000, "PopCorn");
  print(mediumProduct1.calculateDelivery());
  SmallProduct smallProduct1 = new SmallProduct(7500, "PopCorn");
  print(smallProduct1.calculateDelivery());
}