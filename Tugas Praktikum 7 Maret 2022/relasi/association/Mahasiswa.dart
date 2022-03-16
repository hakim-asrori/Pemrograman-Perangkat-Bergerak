import 'Dosen.dart';

class Mahasiswa {
  String? _nim;
  Dosen? _wali;

  Mahasiswa(this._nim, this._wali);

  set nim(String nim) => _nim;

  String get nim => _nim!;

  set wali(Dosen wali) => _wali;

  Dosen get wali => _wali!;
}