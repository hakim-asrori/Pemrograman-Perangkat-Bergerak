import 'dart:io';

void statis() {
  Map data = {
    0: {
      "nim": "09030015",
      "nama": "Udin",
      "matkul": <int, String>{
        0: "PW",
        1: "PBO",
        2: "PPB",
      }
    },
    1: {
      "nim": "09030016",
      "nama": "Joko",
      "matkul": <int, String>{
        0: "Basdat",
        1: "RPL",
      }
    },
  };

  print(data);
}

void dinamis() {
  List<dynamic> namaMatkul =  <dynamic>[];
  var dataMahasiswa = new Map();

  stdout.write("Masukan Jumlah Mahasiswa : ");
  int? jumlahMahasiswa = int.parse(stdin.readLineSync()!);

  String? nim;
  String? nama;
  
  for(int i = 0; i < jumlahMahasiswa; i++) {
    stdout.write("Masukan NIM : ");
    nim = stdin.readLineSync();
    stdout.write("Masukan Nama : ");
    nama = stdin.readLineSync();
    stdout.write("Masukan Jumlah Mata Kuliah : ");
    int? jumlahMataKuliah = int.parse(stdin.readLineSync()!);

    for(int j = 0; j < jumlahMataKuliah; j++) {
      stdout.write("Masukan Mata Kuliah : ");
      namaMatkul.add({stdin.readLineSync()});
    }
    print("--------------------------------");
  
    dataMahasiswa[i] = {
      'nim': nim,
      'nama': nama,
      'matkul': namaMatkul,
    };

    print("--------------------------------");
  }

  print(dataMahasiswa);
}

void main() {
  dinamis();
}
