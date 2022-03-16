class Mobil {
  String? _merk;
  int? _cc;

  Mobil(this._merk, this._cc);

  set merk(String merk) => _merk = merk;

  set cc(int cc) => _cc = cc;

  String get merk => _merk!;
  
  int get cc => _cc!;

  void showInfoMobil() {
    print(merk);
    print(cc);
  }
}