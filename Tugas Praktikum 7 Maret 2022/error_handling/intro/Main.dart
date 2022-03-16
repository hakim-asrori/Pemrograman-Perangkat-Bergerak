import 'Pembagian.dart';

void main(List<String> args) {
  String x = "delapan";
  double y = 0;
  num hasil;

  final pembagian = new Pembagian();

  // hasil = pembagian.hitungPembagian(double.parse(x), y);
  // print(hasil);

  // try {
  //   hasil = pembagian.hitungPembagian(double.parse(x), y);
  //   print(hasil);
  // } on FormatException {
  //   print("Kesalahan format exception");
  // }
  
  try {
    hasil = pembagian.hitungPembagian(double.parse(x), y);
    print(hasil);
  } catch(e) {
    print(e);
  }

  print("hello world!");
}
