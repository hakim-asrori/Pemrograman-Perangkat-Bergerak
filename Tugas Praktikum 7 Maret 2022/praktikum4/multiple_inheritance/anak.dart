import 'ayah.dart';
import 'ibu.dart';

class Anak implements Ayah, Ibu {
  @override
  void menabung() {
    print("Anak bisa menabung");
  }

  @override
  void memasak() {
    print("Anak bisa memasak");
  }

  void melukis() {
    print("Anak bisa melukis");
  }
}