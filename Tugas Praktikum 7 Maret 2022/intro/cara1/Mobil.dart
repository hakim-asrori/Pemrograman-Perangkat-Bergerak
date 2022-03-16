class Mobil {
  String? _merk;
  int? _cc;

  Mobil(this._merk, this._cc);

  void setMerk(String merk) {
    this._merk = merk;
  }

  void setCc(int cc) {
    this._cc = cc;
  }

  String getMerk() {
    return this._merk!;
  }

  int getCc() {
    return this._cc!;
  }

  void showInfoMobil() {
    print(_merk);
    print(_cc);
  }
}