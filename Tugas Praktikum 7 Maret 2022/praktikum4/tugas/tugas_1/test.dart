import 'dart:io';

import 'buku.dart';
import 'mahasiswa.dart';
import 'peminjaman.dart';
import 'pengembalian.dart';
import 'petugas.dart';

void main(List<String> args) {
  stdout.write("Masukan nim : ");
  try {
    int? nim = int.parse(stdin.readLineSync()!);

    var mahasiswa1 = Mahasiswa("Hakim Asrori", nim.toString());
    var mahasiswa2 = Mahasiswa("Ilham Teguh", "2003077");

    var petugas1 = Petugas("Asep", "201");
    var petugas2 = Petugas("Abdul", "202");

    var buku1 = Buku("Basis Data", 5);
    var buku2 = Buku("Bahasa Indonesia", 4);

    var peminjaman1 = Peminjaman(petugas1, mahasiswa1);
    peminjaman1.addBuku(buku1);
    peminjaman1.addBuku(buku2);

    var peminjaman2 = Peminjaman(petugas2, mahasiswa2);
    peminjaman2.addBuku(buku2);

    var listPeminjam = [];
    var peminjaman = {};

    peminjaman['nomor'] = peminjaman1.noPinjaman;
    peminjaman['operator'] = {};
    peminjaman['operator']['idOperator'] = peminjaman1.petugas.id;
    peminjaman['operator']['namaOperator'] = peminjaman1.petugas.nama;
    peminjaman['mahasiswa'] = {};
    peminjaman['mahasiswa']['nim'] = peminjaman1.mahasiswa.nim;
    peminjaman['mahasiswa']['nama'] = peminjaman1.mahasiswa.nama;

    List<Map> listBuku = [];
    for (var buku in peminjaman1.getBuku()) {
      listBuku.add({'judul': buku.judul, 'jumlahBuku': 1});
    }

    peminjaman['buku'] = listBuku;

    listPeminjam.add(peminjaman);

    peminjaman = {};
    peminjaman['nomor'] = peminjaman2.noPinjaman;
    peminjaman['operator'] = {};
    peminjaman['operator']['idOperator'] = peminjaman2.petugas.id;
    peminjaman['operator']['namaOperator'] = peminjaman2.petugas.nama;
    peminjaman['mahasiswa'] = {};
    peminjaman['mahasiswa']['nim'] = peminjaman2.mahasiswa.nim;
    peminjaman['mahasiswa']['nama'] = peminjaman2.mahasiswa.nama;

    listBuku = [];
    for (var buku in peminjaman2.getBuku()) {
      listBuku.add({'judul': buku.judul, 'jumlahBuku': 1});
    }

    peminjaman['buku'] = listBuku;

    listPeminjam.add(peminjaman);

    print(listPeminjam);
    var pengembalian1 = Pengembalian(peminjaman1);
    print("------------------------------");
    print("------------------------------");
    print("Buku yang dikembalikan : ");

    int no = 1;
    for (var bk in pengembalian1.peminjaman.getBuku()) {
      print("${no++}. " + bk.judul);
    }

  } catch (e) {
    print("Ini error ${e}");
  }
}
