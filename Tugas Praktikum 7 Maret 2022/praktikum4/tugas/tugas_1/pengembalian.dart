import 'peminjaman.dart';

class Pengembalian {
  Peminjaman? _peminjaman;

  Pengembalian(this._peminjaman);

  Peminjaman get peminjaman => _peminjaman!;
}