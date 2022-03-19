import 'kartu_debit.dart';
import 'kartu_kredit.dart';
import 'transaksi.dart';

void main(List<String> args) {
  var kartuDebit = KartuDebit();
  var kartuKredit = KartuKredit();

  var transaksi1 = Transaksi.kredit(kartuKredit);
  transaksi1.doPayment(2000);
}