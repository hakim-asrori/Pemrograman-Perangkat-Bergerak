import 'kendaraan_bermotor.dart';

class SepedaMotor extends KendaraanBermotor {
  String? _merk;

  set merk(String merk) => _merk = merk;

  String get merk => _merk!;
}