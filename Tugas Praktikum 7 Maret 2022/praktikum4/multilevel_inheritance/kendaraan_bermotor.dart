import 'transportasi.dart';

class KendaraanBermotor extends Transportasi {
  int? _cc;
  String? _bahanbakar;

  set cc(int cc) => _cc = cc;
  set bahanBakar(String bahanbakar) => _bahanbakar = bahanbakar;

  int get cc => _cc!;
  String get bahanBakar => _bahanbakar!;

  @override
  void turnLeft() {
    print("Pilih kiri");
  }

  @override
  void turnRight() {
    print("Pilih kanan");
  }
}