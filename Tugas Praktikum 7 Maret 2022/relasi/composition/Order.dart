class Order {
  int? _total;

  Order(this._total);

  int get total => _total!;

  set total(int total) => _total;
}