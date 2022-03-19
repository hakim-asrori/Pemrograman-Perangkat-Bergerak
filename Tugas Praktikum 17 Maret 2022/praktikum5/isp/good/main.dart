import 'building.dart';
import 'character.dart';

void main(List<String> args) {
  var b1 = Building();
  var c1 = Character();

  b1.takeDamage();
  c1.move();
  c1.attack();
}