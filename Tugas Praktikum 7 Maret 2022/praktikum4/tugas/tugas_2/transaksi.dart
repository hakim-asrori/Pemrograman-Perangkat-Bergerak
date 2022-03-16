import 'customer.dart';
import 'operator.dart';
import 'pizza.dart';

class Transaksi {
  static int _nomor = 0;
  num? _total;
  List<Pizza> _pizza = [];
  Operator? _operator;
  Customer? _customer;

  Transaksi(this._customer){
    _nomor++;
  }

  void addPizza(Pizza pizza, int qty) {
    _pizza.add(pizza);
    _total = qty;
  }

  void updatePizza(int index, int qty) {
    print(_pizza[index]);
  }

  void deletePizza(int index) {
    _pizza.remove(index);
  }

  void checkout(Operator operator) {
    _operator = operator;
  }

  void hitungTotal() {
    print("Nama Pemesan : ${_customer!.nama} (${_customer!.idCustomer})");
    print("");
    for (var pizza in _pizza) {
      pizza.showPizza();
      print("Total Pesanan : ${_total}");
      print("Harga Pizza : ${pizza.hargaPizza}");
      print("Total Harga : ${_total! * pizza.getHargaPizza()}");
    }
    print("");
    print("Operator : ${_operator!.nama} (${_operator!.idOperator})");
  }
}