import 'jenis_produk.dart';
import 'produk.dart';

void main(List<String> args) {
  JenisProduk jenisProduk1 = JenisProduk('001', 'Sayuran');
  JenisProduk jenisProduk2 = JenisProduk('002', 'Roti');
  JenisProduk jenisProduk3 = JenisProduk('003', 'Buah');

  Produk produk1 = Produk();

  produk1.tambahJenisProduk(jenisProduk1);
  produk1.tambahJenisProduk(jenisProduk2);

  produk1.showJenisProduk();
}