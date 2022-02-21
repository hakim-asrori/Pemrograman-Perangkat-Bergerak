// Tipe Data Dynamic LIST
import 'dart:io';

void dinamis() {
  List<dynamic> data = <dynamic>[];
  data.add("Udin");
  data.add(90);
  data.add('A');
  data.add(true);
  data.add(30.73);

  // print(data);

  List<dynamic> data2 = [
    'Udin',
    {'jalan' : 'Sudirman', 'no': '80'},
  ];

  stdout.write("Masukan nama jalan : ");
  String? nama = stdin.readLineSync();
  stdout.write("Masukan nomer jalan : ");
  int? nomer = int.parse(stdin.readLineSync()!);

  data2.add({'jalan': nama, 'no': nomer});

  print("Nama : " + data2[0]);
  print("Jalan : " + data2[1]['jalan']);
  print("Nomer : " + data2[1]['no']);
  print("----------------------");
  print("Jalan : " + data2[2]['jalan']);
  print("Nomer : " + data2[2]['no'].toString());
}

// Tipe Data Dynamic SET
// void listis() {
//   Set<dynamic> data = {"Udin", 90, 'A', true, 30.73};
// }

// Tipe Data Num
// void number() {
//   List<num> data = <num>[];
//   data.add("Udin");
//   data.add(90);
//   data.add('A');
//   data.add(true);
//   data.add(30.73);

//   print(data);
// }

// Tipe Data Var
// void variable() {
//   List<var> data = <var>[];
//   data.add("Udin");
//   data.add(90);
//   data.add('A');
//   data.add(true);
//   data.add(30.73);

//   print(data);
// }

void main() {
  dinamis();
}