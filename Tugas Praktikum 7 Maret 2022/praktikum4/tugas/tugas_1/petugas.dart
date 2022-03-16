import 'person.dart';

class Petugas extends Person {
  String? _idPetugas;

  Petugas(String? nama, this._idPetugas) : super(nama);
  
  String get id => _idPetugas!;

  @override
  void showPerson() {
    super.showPerson();
    print(_idPetugas);
  }
}