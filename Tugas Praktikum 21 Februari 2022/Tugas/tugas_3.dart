import 'dart:io';

void main(List<String> args) {
  var dataBuku = new Map();
  var dataMahasiswa = new Map();
  List<dynamic> dataPeminjam = <dynamic>[];
  List<dynamic> dataPinjaman = <dynamic>[];

  stdout.write('Masukan jumlah buku : ');
  int? jumlahBuku = int.parse(stdin.readLineSync()!);

  print("");

  for (int i = 1; i <= jumlahBuku; i++) {
    stdout.write('Masukan judul buku : ');
    String? judulBuku = stdin.readLineSync()!;
    stdout.write('Masukan penerbit buku : ');
    String? penerbitBuku = stdin.readLineSync()!;
    stdout.write('Masukan stok buku : ');
    int? stokBuku = int.parse(stdin.readLineSync()!);

    print("");

    dataBuku[i] = {
      'id': '00$i',
      'judul': judulBuku,
      'penerbit': penerbitBuku,
      'stok': stokBuku,
    };
  }

  print("------------------------------");

  stdout.write('Masukan jumlah mahasiswa : ');
  int? jumlahMahasiswa = int.parse(stdin.readLineSync()!);

  print("");

  for (int j = 1; j <= jumlahMahasiswa; j++) {
    stdout.write('Masukan nim mahasiswa : ');
    String? nimMahasiswa = stdin.readLineSync()!;
    stdout.write('Masukan nama mahasiswa : ');
    String? namaMahasiswa = stdin.readLineSync()!;

    dataMahasiswa[j] = {'nim': nimMahasiswa, 'nama': namaMahasiswa};

    print("");
  }

  print("------------------------------");

  stdout.write('Masukan jumlah peminjam : ');
  int? jumlahPeminjam = int.parse(stdin.readLineSync()!);

  print("");

  print("Data Mahasiswa");
  print(dataMahasiswa);
  print("Data Buku");
  print(dataBuku);

  print("");

  for (int k = 1; k <= jumlahPeminjam; k++) {
    stdout.write('Masukan index mahasiswa : ');
    int? indexMahasiswa = int.parse(stdin.readLineSync()!);
    stdout.write('Masukan jumlah pinjaman buku : ');
    int? jumlahPinjaman = int.parse(stdin.readLineSync()!);

    dataPinjaman = <dynamic>[];
    for (var l = 1; l <= jumlahPinjaman; l++) {
      stdout.write('Masukan index buku : ');
      int? indexBuku = int.parse(stdin.readLineSync()!);
      dataBuku[indexBuku]['stok'] -= 1;
      dataPinjaman.add(indexBuku);
    }

    dataPeminjam.add({
      k: {
        'nim': dataMahasiswa[indexMahasiswa]['nim'],
        'nama': dataMahasiswa[indexMahasiswa]['nama'],
        'buku': {
          for (var dp in dataPinjaman) {
            'id': dataBuku[dp]['id'],
            'judul': dataBuku[dp]['judul']
          }
        }
      }
    });
    
    print("");
  }

  print("------------------------------");

  print("");
  print(dataPeminjam);

  print("");

  print("Data Buku :");
  print(dataBuku);
}