import 'kartu_debit.dart';
import 'kartu_kredit.dart';
import 'transaksi.dart';

void main(List<String> args) {
  var kartuDebit = KartuDebit();
  var kartuKredit = KartuKredit();

  var transaksi1 = Transaksi(kartuKredit);
  transaksi1.doPayment(2500);

  var transaksi2 = Transaksi(kartuDebit);
  transaksi2.doPayment(7000);
}