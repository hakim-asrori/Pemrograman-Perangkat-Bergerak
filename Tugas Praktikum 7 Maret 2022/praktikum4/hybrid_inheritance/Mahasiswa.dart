import 'Person.dart';

class Mahasiswa extends Person {
  String? _nim;

  Mahasiswa(String? nama, this._nim) : super(nama);

  void setNim(String nim) {
    this._nim = nim;
  }

  String get nim => _nim!;
}