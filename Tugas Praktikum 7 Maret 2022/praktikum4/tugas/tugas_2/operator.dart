import 'person.dart';

class Operator extends Person {
  String? _idOperator;

  Operator(String? nama, this._idOperator) : super(nama);

  String get idOperator => _idOperator!;

  @override
  void showPerson() {
    super.showPerson();
    print(_idOperator);
  }
}