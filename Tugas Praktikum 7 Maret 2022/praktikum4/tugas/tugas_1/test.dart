import 'buku.dart';
import 'mahasiswa.dart';
import 'peminjaman.dart';
import 'pengembalian.dart';
import 'petugas.dart';

void main(List<String> args) {
  var mahasiswa1 = Mahasiswa("Hakim Asrori", "2003071");
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
  peminjaman['buku'] = peminjaman1.getBuku();

  listPeminjam.add(peminjaman);
  peminjaman = {};
  peminjaman['nomor'] = peminjaman2.noPinjaman;
  peminjaman['operator'] = {};
  peminjaman['operator']['idOperator'] = peminjaman2.petugas.id;
  peminjaman['operator']['namaOperator'] = peminjaman2.petugas.nama;
  peminjaman['mahasiswa'] = {};
  peminjaman['mahasiswa']['nim'] = peminjaman2.mahasiswa.nim;
  peminjaman['mahasiswa']['nama'] = peminjaman2.mahasiswa.nama;
  peminjaman['buku'] = peminjaman2.getBuku();

  listPeminjam.add(peminjaman);
  var pengembalian = Pengembalian(listPeminjam[1]);
  print(listPeminjam);
  print("------------------------------");
  print("------------------------------");
  print(pengembalian.getPeminjaman());
}