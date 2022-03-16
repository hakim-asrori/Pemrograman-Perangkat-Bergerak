import 'Customer.dart';

void main(List<String> args) {
  Customer customer1 = Customer("001");
  customer1.membuatOrder(3500);
  print("Id customer = ${customer1.id}");
  print("Total order = ${customer1.order.total}");

  Customer customer2 = Customer("002");
  customer2.membuatOrder(150);
  print("Id customer = ${customer2.id}");
  print("Total order = ${customer2.order.total}");
}