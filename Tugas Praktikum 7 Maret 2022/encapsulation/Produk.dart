class Produk {
  String? _id;
  num? _harga;

  Produk(this._id, this._harga);

  set id(String id) => _id;
  set harga(num harga) => _harga;

  String get id => _id!;
  num get harga => _harga!;
}