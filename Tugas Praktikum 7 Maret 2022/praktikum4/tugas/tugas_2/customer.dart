import 'person.dart';

class Customer extends Person {
  String? _idCustomer;

  Customer(String? nama, this._idCustomer) : super(nama);

  String get idCustomer => _idCustomer!;

  @override
  void showPerson() {
    super.showPerson();
    print(_idCustomer);
  }
}