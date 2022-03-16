import 'bangun_datar.dart';

class Segitiga extends BangunDatar {
  int? _sisiMiring;

  Segitiga.panjang(int? panjang) : super.panjang(panjang);

  set sisiMiring(int sisimiring) => _sisiMiring = sisimiring;
  int get sisiMiring => _sisiMiring!;
}