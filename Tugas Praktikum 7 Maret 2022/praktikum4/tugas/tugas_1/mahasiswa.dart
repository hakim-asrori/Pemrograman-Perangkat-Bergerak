import 'person.dart';

class Mahasiswa extends Person {
  String? _nim;

  Mahasiswa(String? nama, this._nim) : super(nama);

  String get nim => _nim!;

  @override
  void showPerson(){
    super.showPerson();
    print(_nim);
  }
}