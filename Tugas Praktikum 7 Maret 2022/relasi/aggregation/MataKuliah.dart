class MataKuliah {
  String? _kodeMatkul;
  String? _namaMatkul;

  MataKuliah(this._kodeMatkul, this._namaMatkul);

  String get kodeMakul => _kodeMatkul!;

  set kodeMakul(String value) => _kodeMatkul;

  String get namaMakul => _namaMatkul!;

  set namaMakul(String value) => _namaMatkul;
}