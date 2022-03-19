import 'kartu_debit.dart';
import 'kartu_kredit.dart';

class Transaksi {
  KartuDebit? _kartiDebit;
  KartuKredit? _kartiKrebit;

  Transaksi.debit(this._kartiDebit);
  Transaksi.kredit(this._kartiKrebit);

  void doPayment(int total) {
    // _kartiDebit!.doTransaksi(total);
    _kartiKrebit!.doTransaksi(total);
  }
}