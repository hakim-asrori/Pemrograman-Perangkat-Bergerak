import 'product_calculator.dart';
import 'product_manipulator.dart';

void main(List<String> args) {
  var produk1 = ProductManipulator(25000, "Buku");
  produk1.editPrice(35000);
  produk1.editName("Buku Tulis");

  var kalkulator = ProductCalculator();

  print(kalkulator.calculatePPN(produk1));
  print(kalkulator.calculatePPH(produk1));
}