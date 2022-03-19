import 'product_manipulator.dart';

void main(List<String> args) {
  var produk1 = ProductManipulator(20000, "Materai 10k");
  produk1.editPrice(12000);
  produk1.editName("Materai 10000");

  print(produk1.calculatePPN());
  print(produk1.calculatePPH());
}