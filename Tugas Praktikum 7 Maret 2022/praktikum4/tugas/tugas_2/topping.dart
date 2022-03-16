class Topping {
  num? _hargaTopping;
  String? _namaTopping;

  Topping(this._hargaTopping, this._namaTopping);

  set hargaTopping(num hargaTopping) => _hargaTopping = hargaTopping;
  num get hargaTopping => _hargaTopping!;
  
  set namaTopping(String namaTopping) => _namaTopping = namaTopping;
  String get namaTopping => _namaTopping!;
}