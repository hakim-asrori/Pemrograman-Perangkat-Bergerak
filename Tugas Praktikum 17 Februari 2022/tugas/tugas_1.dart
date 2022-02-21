import 'dart:io';

double rumus(double uts, double uas, double tugas) {
  var hasil = (uts + uas + tugas) / 3;
  return hasil;
}

main() {
  print("");
  stdout.write("Masukan Nama Mata Kuliah = ");
  String nama = stdin.readLineSync()!;

  print("");

  stdout.write("Masukan Nilai UTS = ");
  double uts = double.parse(stdin.readLineSync()!);

  print("");

  stdout.write("Masukan Nilai UAS = ");
  double uas = double.parse(stdin.readLineSync()!);

  print("");

  stdout.write("Masukan Nilai Tugas = ");
  double tugas = double.parse(stdin.readLineSync()!);

  print("");

  double totalNilai = rumus(uts, uas, tugas);

  print("Nama Mata Kuliah = $nama");
  print("Total Nilai = " + totalNilai.toStringAsFixed(2));
}
