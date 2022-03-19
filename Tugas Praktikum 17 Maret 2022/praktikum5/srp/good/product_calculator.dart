import 'product_manipulator.dart';

class ProductCalculator {
  double calculatePPN(ProductManipulator product) {
    return product.price! * 10 / 100;
  }

  double calculatePPH(ProductManipulator product) {
    return product.price! * 0.25 / 100;
  }
}