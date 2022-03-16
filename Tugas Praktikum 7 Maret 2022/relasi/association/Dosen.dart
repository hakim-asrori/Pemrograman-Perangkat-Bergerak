import 'Mahasiswa.dart';

class Dosen {
  String? _nidn;
  List<Mahasiswa> _listMahasiswa = [];

  Dosen(this._nidn);

  String get nidn => _nidn!;

  set nidn(String nidn) => _nidn;

  void addMahasiswaWali(Mahasiswa mahasiswa) {
    _listMahasiswa.add(mahasiswa);
  }

  void showMahasiswaWali() {
    print("NIDN : $_nidn");
    print("Daftar mahasiswa wali");
    for (var data in _listMahasiswa) {
      print("NIM : ${data.nim}");
    }
    print('\n');
  }
}