import 'dart:io';

// void statis() {
//   Map data = {
//     0: {
//       "nim": "09030015",
//       "nama": "Udin",
//       "matkul": <int, String>{
//         0: "PW",
//         1: "PBO",
//         2: "PPB",
//       }
//     },
//     1: {
//       "nim": "09030016",
//       "nama": "Joko",
//       "matkul": <int, String>{
//         0: "Basdat",
//         1: "RPL",
//       }
//     },
//   };

//   print(data);
// }

void dinamis() {
  // Deklarasi Variable
  var namaMatkul =  new Map();
  var dataMahasiswa = new Map();
  
  String? nim;
  String? nama;
  
  // Memasukan jumlah mahasiswa
  stdout.write("Masukan Jumlah Mahasiswa : ");
  int? jumlahMahasiswa = int.parse(stdin.readLineSync()!); // Konversi dari String ke int

  print("--------------------------------");
  
  // Looping jumlah mahasiswa
  for(int i = 0; i < jumlahMahasiswa; i++) {
    // Memasukan nim, nama mahasiswa
    stdout.write("Masukan NIM : ");
    nim = stdin.readLineSync(); // data input dimasukan ke variable nim
    stdout.write("Masukan Nama : ");
    nama = stdin.readLineSync(); // data input dimasukan ke variable nama
    
    // Memasukan jumlah mata kuliah
    stdout.write("Masukan Jumlah Mata Kuliah : ");
    int? jumlahMataKuliah = int.parse(stdin.readLineSync()!); // Konversi dari String ke int
    
    // Deklarasi ulang atau pengosongan data yang sudah ada
    namaMatkul = new Map();
    
    //Looping jumlah mata kuliah
    for(int j = 0; j < jumlahMataKuliah; j++) {
      // Memasukan nama mata kuliah
      stdout.write("Masukan Mata Kuliah : ");
      namaMatkul[j] = stdin.readLineSync(); // data input dimasukan ke variable namaMatkul dengan index iterasi yang ditentukan looping
    }
  
    dataMahasiswa[i] = {
      'nim': nim,
      'nama': nama,
      'matkul': namaMatkul,
    }; // Penyimpanan variable nim, nama, dan namaMatkul ke dalam variable dataMahasiswa dengan index iterasi yang ditentukan looping

    print("--------------------------------");
  }
  
  print("--------------------------------");
  print(dataMahasiswa); // Menampilkan data yang disimpan di variable dataMahasiswa
}

void main() {
  dinamis();
}
