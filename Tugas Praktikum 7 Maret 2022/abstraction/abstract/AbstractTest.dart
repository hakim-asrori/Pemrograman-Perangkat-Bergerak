import 'Persegi.dart';

void main(List<String> args) {
  var persegi = new Persegi();
  persegi.sisi = 2;

  print(persegi.hitungKeliling());
  print(persegi.hitungLuas());
}