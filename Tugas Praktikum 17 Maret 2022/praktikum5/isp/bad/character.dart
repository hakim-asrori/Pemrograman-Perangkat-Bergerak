import 'entity.dart';

class Character implements Entity {
  void attack() {
    print("attack character");
  }

  void move() {
    print("move character");
  }

  void takeDamage() {
    print("take damage character");
  }
  
}