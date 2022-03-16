import 'Kendaraan.dart';
import 'Truk.dart';

void main(List<String> args) {
  Kendaraan kendaraan1 = new Kendaraan(2000, 'Suzuki');
  kendaraan1.maju();

  print('');

  Truk truk1 = new Truk(9000, 'Hino', 'Container');
  truk1.maju();
}