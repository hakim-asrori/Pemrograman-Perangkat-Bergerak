void tugas() {
  List<String> matkul = <String>[];

  stdout.write("Siapa nama anda? ");
  String? nama = stdin.readLineSync();
  print("Hallo $nama");
  print("");

  stdout.write("Masukan jumlah mata kuliah : ");
  String? jumlah = stdin.readLineSync();
  int jumlahMatkul = int.parse(jumlah!);
  print("");

  for (var i = 1; i <= jumlahMatkul; i++) {
    stdout.write("Masukan Nama Mata Kuliah ke $i = ");
    matkul.add(stdin.readLineSync()!);
  }

  int no = 1;
  print("");
  print("Data Mata Kuliah Anda");
  for (var m in matkul) {
    print("${no++}. $m");
  }
  
}

void main() {
  tugas();
}
