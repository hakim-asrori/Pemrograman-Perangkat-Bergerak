// class Peminjaman {
//   dynamic _peminjam;

//   void cek(dynamic cek) {
//     _peminjam = cek;
//   }

//   dynamic show() {
//     return _peminjam;
//   }
// }
import 'buku.dart';
import 'mahasiswa.dart';
import 'petugas.dart';

class Peminjaman {
  static int counterPeminjaman = 0;
  String? _noPinjaman;
  Petugas? _petugas;
  Mahasiswa? _mahasiswa;
  Set<Buku> _buku = Set<Buku>();

  Peminjaman(this._petugas, this._mahasiswa) {
    counterPeminjaman++;
    _noPinjaman = counterPeminjaman.toString();
  }

  String get noPinjaman => _noPinjaman!;
  Petugas get petugas => _petugas!;
  Mahasiswa get mahasiswa => _mahasiswa!;

  void addBuku(Buku buku) {
    _buku.add(buku);
  }

  dynamic getBuku() {
    return _buku;
  }

}
