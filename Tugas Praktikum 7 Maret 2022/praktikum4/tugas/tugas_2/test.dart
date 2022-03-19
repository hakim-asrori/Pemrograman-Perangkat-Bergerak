import 'dart:io';

import 'customer.dart';
import 'operator.dart';
import 'pizza.dart';
import 'topping.dart';
import 'transaksi.dart';

void main(List<String> args) {
  stdout.write("Masukan harga : ");
  String harga = stdin.readLineSync()!;
  try {
    var operator1 = Operator("Operator A", "OP1");
    var operator2 = Operator("Operator B", "OP2");

    var customer1 = Customer("Customer A", "CU1");

    var topping1 = Topping(int.parse(harga), "Daging");
    var topping2 = Topping(2000, "Sosis");

    var pizza1 = Pizza("Pizza Alakadarnya", 10000);
    pizza1.addTopping(topping1);
    pizza1.addTopping(topping2);

    var transaksi1 = Transaksi("Customer B", "CU2");
    transaksi1.addPizza(pizza1, 1);
    transaksi1.checkout(operator1);
    transaksi1.hitungTotal();
  } catch (e) {
    print("Ini error karena ${e}");
  }
}
