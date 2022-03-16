import 'MataKuliah.dart';

class Mahasiswa {
  String? _nim;
  List<MataKuliah> _dataMatkul = [];

  Mahasiswa(this._nim);

  void mengambilMatkul(MataKuliah matkul) {
    _dataMatkul.add(matkul);
  }

  void showDataMatkul() {
    print("NIM = ${_nim}");
    print("Data Mata Kuliah : ");

    for (var element in _dataMatkul) {
      print(element.kodeMakul);
      print(element.namaMakul);
    }
  }
}