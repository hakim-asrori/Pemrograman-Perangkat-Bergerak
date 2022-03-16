import 'Order.dart';

class Customer {
  String? _id;
  Order? _order;

  Customer(this._id);

  void membuatOrder(int total) {
    _order = Order(total);
  }

  Order get order => _order!;

  String get id => _id!;

  set id(String id) => _id;
}