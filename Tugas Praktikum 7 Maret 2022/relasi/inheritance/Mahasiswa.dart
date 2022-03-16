import 'Person.dart';

class Mahasiswa extends Person {
  String? _nim;

  Mahasiswa(String? nama, this._nim) : super(nama);

  String get nim => _nim!;

  set nim(String nim) => _nim;  
}