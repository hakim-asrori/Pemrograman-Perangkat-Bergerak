import 'dart:io';

void main() {
  String diskon;

  stdout.write("Masukan nama anda : ");
  String? nama = stdin.readLineSync();

  stdout.write("Masukan total belanja anda : ");
  int? belanja = int.parse(stdin.readLineSync()!);

  stdout.write("Metode Pembayaran [Kartu = 1, Non Kartu = 0] : ");
  int? kartu = int.parse(stdin.readLineSync()!);

  if (kartu == 1) {
    if (belanja > 100000) {
      diskon = "15rb";
    } else if (belanja > 500000) {
      diskon = "50rb";
    } else {
      diskon = "Tidak ada diskon";
    }
  } else {
    if (belanja > 100000) {
      diskon = "5rb";
    } else {
      diskon = "Tidak ada diskon";
    }
  }

  print('Total Diskon : $diskon');
}