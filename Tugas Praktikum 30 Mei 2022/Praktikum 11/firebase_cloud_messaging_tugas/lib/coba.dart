Future<void> printOrderMessage() async {
  print('Eksekusi Cetak Pesan');
  var order = await fetchUserOrder();
  print('Pesanan : $order');
}

Future<String> fetchUserOrder() {
  return Future.delayed(const Duration(seconds: 4), () => 'Nasi Uduk');
}

void main() {
  print("Hitung Maju");
  countSeconds(4);
  printOrderMessage();
}

void countSeconds(int s) {
  for (var i = 1; i <= s; i++) {
    Future.delayed(Duration(seconds: i), () => print(i));
  }
}
