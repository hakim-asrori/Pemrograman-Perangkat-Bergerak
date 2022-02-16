import 'dart:io';

// Hello World
void hello() {
  print("Hallo Kelas TI.C");
}

// Konstanta
void konstanta() {
  final namaDepan = "Hakim";
  final namaBelakang = "Asrori";
  print(namaDepan + namaBelakang);
  print(namaBelakang);
  print("Saya Adalah $namaDepan $namaBelakang");
}

// Tipe Data
void tipeData() {
  var a = 1;
  var b = 1.0;

  int x = 8;
  double y = b + 6;
  num z = 10 - y + x;

  const valueA = 7;
  const valueB = 2 * valueA;

  print("a = $a");
  print("b = $b");
  print("x = $x");
  print("y = $y");
  print("z = $z");
  print("valueA = $valueA");
  print("valueB = $valueB");
}

// Parsing Tipe Data
void parsing() {
  String value = "17";

  var a = int.parse(value);
  var b = double.parse("0.98");
  var c = int.parse("11000000", radix: 2);

  print("$a");
  print("$b");
  print("$c");

  String v1 = a.toString();
  String v2 = b.toString();
  String v3 = b.toStringAsFixed(2);

  print("$v1");
  print("$v2");
  print("$v3");
}

// String
void string() {
  var age = 20;
  var myAge = 'Saya sekarang berumur $age tahun';
  // var myAge = 'Saya sekarang berumur ' + age.toString() + ' tahun';

  print("$myAge");
}

// Enumerasi
enum Nama {Hakim, Asrori, Cah, Ganteng}
void enumerasi() {
  Nama liked = Nama.Hakim;
  var disliked = Nama.Cah.index;

  print(liked.toString());
  print(disliked.toString());
}

// Booleans
void boolean() {}

// Null Safety
void null_safety() {
  // int? nim;
  // nim = 2003071;

  // print("$nim");

  print("Enter your nim : ");
  String? nim = stdin.readLineSync();

  print("NIM anda $nim");
}

// Arrays
void array() {
  // final myList = [1, 2.3, 4, 5, 6.7];
  // myList.add(8);
  // final value = myList[5];

  List<String> daftarNama = <String>[];
  daftarNama.add("Hakim");
  daftarNama.add("Asrori");

  for (var nama in daftarNama) {
    print("${nama}");
  }
}

// Perulangan
void perulangan() {
  for (var i = 0; i < 5; i++) {
    print("Nilai ke $i");
  }
}

// Tugas
void tugas() {
  List<String> matkul = <String>[];

  print("Siapa nama anda?");
  String? nama = stdin.readLineSync();
  print("Hallo $nama");
  print("");
  print("Masukan jumlah mata kuliah : ");
  String? jumlah = stdin.readLineSync();
  var jumlahInt = int.parse(jumlah!);

  for (var i = 1; i <= jumlahInt; i++) {
    print("Mata Kuliah $i = ");
    matkul.add(stdin.readLineSync()!);
  }

  print("");
  print("Data Mata Kuliah Anda");
  for (var m in matkul) {
    print("$m");
  }
  
}

void main() {
  tugas();
}