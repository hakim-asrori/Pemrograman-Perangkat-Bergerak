import 'motor.dart';

class Pengemudi {
  String? _nama;
  Motor? _motor;

  Pengemudi(this._nama);

  set nama(String nama) => _nama = nama;
  String get nama => _nama!;

  set motor(Motor motor) => _motor = motor;
  Motor get motor => _motor!;
}