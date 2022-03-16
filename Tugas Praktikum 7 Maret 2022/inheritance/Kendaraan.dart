import 'dart:io';

class Kendaraan {
  String? _merk;
  int? _cc;

  Kendaraan(this._cc, this._merk);

  void maju() {
    stdout.write("Kendaraan merk ${this._merk} dengan CC ${this._cc} maju");
  }
}