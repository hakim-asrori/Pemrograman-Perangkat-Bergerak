import 'kartu_bank.dart';

class KartuDebit implements KartuBank {
  @override
  void doTransaksi(int total) {
    print("Transaksi sejumlah $total dengan kartu dedit");
  }
}