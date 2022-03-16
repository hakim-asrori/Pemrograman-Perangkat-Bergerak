import 'jenis_produk.dart';

class Produk {
  List<JenisProduk> _dataJenisProduk = [];

  void tambahJenisProduk(JenisProduk jenis) {
    _dataJenisProduk.add(jenis);
  }

  void showJenisProduk() {
    for (var jenisProduk in _dataJenisProduk) {
      print("${jenisProduk.kodeJenis} : ${jenisProduk.namaJenis}");
    }
  }
}