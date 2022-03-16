class Buku {
  String? _judulBuku;
  int? _stok;

  Buku(this._judulBuku, this._stok);

  String get judul => _judulBuku!;

  int get stok => _stok!;
}