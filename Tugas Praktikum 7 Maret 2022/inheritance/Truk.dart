import 'dart:io';

import 'Kendaraan.dart';

class Truk extends Kendaraan {
  String? _gandengan;

  Truk(int? cc, String? merk, this._gandengan) : super(cc, merk);

  set gandengan(String gandengan) => _gandengan;

  String get gandengan => _gandengan!;

  void maju() {
    super.maju();
    stdout.write(" dengan gandengan ${this._gandengan}");
  }
}