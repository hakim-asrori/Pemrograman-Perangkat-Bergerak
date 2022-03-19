import 'kartu_bank.dart';

class KartuKredit implements KartuBank {
  @override
  void doTransaksi(int total) {
    print("Transaksi sejumlah $total dengan kartu kredit");
  }
}