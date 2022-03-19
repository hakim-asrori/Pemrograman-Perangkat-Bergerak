import 'bird.dart';

class Penguin extends Bird {
  @override
  void fly() {
    // penguin tidak bisa terbang
  }

  void swim() {
    print("Penguin swim!");
  }
}