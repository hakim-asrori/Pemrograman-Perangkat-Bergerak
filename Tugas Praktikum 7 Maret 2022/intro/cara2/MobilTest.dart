import 'Mobil.dart';

void main(List<String> args) {
  Mobil mobil1 = new Mobil("Toyota", 1500);

  mobil1.merk = "Honda";
  mobil1.cc = 2000;

  mobil1.showInfoMobil();
}