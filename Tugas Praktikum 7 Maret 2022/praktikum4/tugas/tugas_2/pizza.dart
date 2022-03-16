import 'topping.dart';

class Pizza {
  static int counter = 0;
  int? _idPizza;
  String? _namaPizza;
  num? _hargaPizza;
  Set<Topping> _topping = new Set<Topping>();

  Pizza(this._namaPizza, this._hargaPizza) {
    counter++;
  }

  set namaPizza(String namaPizza) => _namaPizza = namaPizza;
  String get namaPizza => _namaPizza!;

  void addTopping(Topping topping) {
    _topping.add(topping);
  }

  void deleteTopping(int index) {
    _topping.remove(index);
  }

  num get hargaPizza => _hargaPizza!;

  num getHargaPizza() {
    for (var topping in _topping) {
      _hargaPizza = _hargaPizza! + topping.hargaTopping;
    }

    return _hargaPizza!;
  }

  void showPizza() {
    print("$_namaPizza dengan toping : ");
    for (var topping in _topping) {
      print("${counter++}. ${topping.namaTopping} (${topping.hargaTopping})");
    }
  }
}