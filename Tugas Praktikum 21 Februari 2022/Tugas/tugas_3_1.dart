// Pemanggilan library
import 'dart:io';

// Deklarasi Variabel Secara Global
var dataBuku = new Map();
var dataMahasiswa = new Map();
List<dynamic> dataPeminjam = <dynamic>[];
List<dynamic> dataPinjaman = <dynamic>[];

// Fungsi yang dijalankan pertama kali
void main(List<String> args) {
  // Pengarahan atau redirect ke fungsi mainMenu()
  mainMenu();
}

// Fungsi yang menampilkan menu awal
void mainMenu() {
  clearScreen();
  print("------------------------------");
  print("-       SELAMAT DATANG       -");
  print("------------------------------");
  print("");

  print("[1] Data Buku");
  print("[2] Data Mahasiswa");
  print("[3] Data Peminjaman");
  print("[4] Selesai");

  stdout.write("Masukan kode menu : ");
  int? kodeMenu = int.parse(stdin.readLineSync()!);

  if (kodeMenu == 1) {
    // Pengarahan atau redirect ke fungsi menuBuku()
    menuBuku();
  } else if (kodeMenu == 2) {
    // Pengarahan atau redirect ke fungsi menuMahasiswa()
    menuMahasiswa();
  } else if (kodeMenu == 3) {
    // Pengarahan atau redirect ke fungsi menuPeminjaman()
    menuPeminjaman();
  }
}

// Fungsi yang menampilkan menu buku
void menuBuku() {
  print("------------------------------");
  print("-         Menu Buku          -");
  print("------------------------------");
  print("");
  print("[1] Masukan Data Buku");
  print("[2] Lihat Data Buku");
  print("[3] Hapus Data Buku");
  print("[4] Keluar");

  stdout.write("Masukan kode menu : ");
  int? kodeMenu = int.parse(stdin.readLineSync()!);

  if (kodeMenu == 1) {
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

      if (stokBuku >= 2) {
        // Pengkondisian apabila stok buku lebih dari 2
        print("");

        dataBuku[i] = {
          'id': '00$i',
          'judul': judulBuku,
          'penerbit': penerbitBuku,
          'stok': stokBuku,
        };
      } else {
        print("Maaf masukan jumlah stok minimal 2!");
      }
    }

    menuBuku();
  } else if (kodeMenu == 2) {
    print(dataBuku);

    print("");

    menuBuku();
  } else if (kodeMenu == 3) {
    print(dataBuku);

    print("");

    stdout.write('Masukan index buku : ');
    int? indexBuku = int.parse(stdin.readLineSync()!);
    // Menghapus buku melalui index
    dataBuku.remove(indexBuku);

    menuBuku();
  } else if (kodeMenu == 4) {
    mainMenu();
  }
}

void menuMahasiswa() {
  // clearScreen();
  print("------------------------------");
  print("-       Menu Mahasiswa       -");
  print("------------------------------");
  print("");
  print("[1] Masukan Data Mahasiswa");
  print("[2] Lihat Data Mahasiswa");
  print("[3] Hapus Data Mahasiswa");
  print("[4] Keluar");

  stdout.write("Masukan kode menu : ");
  int? kodeMenu = int.parse(stdin.readLineSync()!);

  if (kodeMenu == 1) {
    stdout.write('Masukan jumlah mahasiswa : ');
    int? jumlahMahasiswa = int.parse(stdin.readLineSync()!);

    print("");

    for (int i = 1; i <= jumlahMahasiswa; i++) {
      stdout.write('Masukan nim mahasiswa : ');
      String? nim = stdin.readLineSync()!;
      stdout.write('Masukan nama mahasiswa : ');
      String? nama = stdin.readLineSync()!;

      print("");

      dataMahasiswa[i] = {
        'nim': nim,
        'nama': nama,
      };
    }

    menuMahasiswa();
  } else if (kodeMenu == 2) {
    print(dataMahasiswa);

    print("");

    menuMahasiswa();
  } else if (kodeMenu == 3) {
    print(dataMahasiswa);

    print("");

    stdout.write('Masukan index buku : ');
    int? indexBuku = int.parse(stdin.readLineSync()!);

    // Menghapus mahasiswa melalui index
    dataMahasiswa.remove(indexBuku);

    menuMahasiswa();
  } else if (kodeMenu == 4) {
    mainMenu();
  }
}

void menuPeminjaman() {
  // clearScreen();
  print("------------------------------");
  print("-       Menu Pinjaman        -");
  print("------------------------------");
  print("");
  print("[1] Masukan Data Peminjaman");
  print("[2] Lihat Data Peminjaman");
  print("[3] Hapus Data Peminjaman");
  print("[4] Keluar");

  stdout.write("Masukan kode menu : ");
  int? kodeMenu = int.parse(stdin.readLineSync()!);

  if (kodeMenu == 1) {
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

      if (jumlahPinjaman > 2) {
        print("Maaf peminjaman maksimal 2 buku!");
      } else {
        dataPinjaman = <dynamic>[];
        for (var l = 1; l <= jumlahPinjaman; l++) {
          stdout.write('Masukan index buku : ');
          int? indexBuku = int.parse(stdin.readLineSync()!);
          if (dataBuku[indexBuku]['stok'] == 1) {
            print("Sisa stok " +
                dataBuku[indexBuku]['stok'] +
                ', tidak dapat dipinjam!');
          } else {
            dataBuku[indexBuku]['stok'] -= 1;
            dataPinjaman.add(indexBuku);
          }
        }

        dataPeminjam.add({
          k: {
            'nim': dataMahasiswa[indexMahasiswa]['nim'],
            'nama': dataMahasiswa[indexMahasiswa]['nama'],
            'buku': {
              for (var dp in dataPinjaman)
                {'id': dataBuku[dp]['id'], 'judul': dataBuku[dp]['judul']}
            }
          }
        });
      }

      print("");
    }

    menuPeminjaman();
  } else if (kodeMenu == 2) {
    print(dataPeminjam);

    print("");

    menuPeminjaman();
  } else if (kodeMenu == 3) {
    print(dataPeminjam);

    print("");

    stdout.write('Masukan index peminjam : ');
    int? indexPeminjam = int.parse(stdin.readLineSync()!);

    // Menghapus peminjam melalui index
    dataPeminjam.remove(indexPeminjam);

    menuPeminjaman();
  } else if (kodeMenu == 4) {
    mainMenu();
  }
}

void clearScreen() {
  print("\x1B[2J\x1B[0;0H");
}
