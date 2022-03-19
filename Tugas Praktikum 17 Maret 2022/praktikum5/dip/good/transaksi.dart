import 'kartu_bank.dart';

class Transaksi {
  KartuBank? _kartuBank;

  Transaksi(this._kartuBank);

  void doPayment(int total) {
    _kartuBank!.doTransaksi(total);
  }
}