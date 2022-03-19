import 'entity.dart';

class Building implements Entity {
  void attack() {
    print("attack building");
  }

  void move() {
    print("move building");
  }

  void takeDamage() {
    print("take damage building");
  }
  
}