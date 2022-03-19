import 'entity.dart';
import 'entity_move.dart';

class Character implements Entity, EntityMove {
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