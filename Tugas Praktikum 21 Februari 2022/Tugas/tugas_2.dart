import 'dart:io';

void main() {
  stdout.write("Masukan jumlah anak ayam : ");
  int n = int.parse(stdin.readLineSync()!);

  print("Anak ayam turun $n");
  for (var i = n; i >= 1; i--) {
    if (i-1 == 0) {
      print("Anak ayam turun $i, mati satu tinggal induknya");
    } else {
      print("Anak ayam turun $i, mati satu tinggal ${i-1}");
    }
  }
}