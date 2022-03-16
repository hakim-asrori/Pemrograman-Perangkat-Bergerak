import 'pengemudi.dart';

class Motor {
  num? _cc;
  Pengemudi? _pengemudi;

  Motor(this._cc);

  set cc(num cc) => _cc = cc;
  num get cc => _cc!;

  set pengemudi(Pengemudi pengemudi) => _pengemudi = pengemudi;
  Pengemudi get pengemudi => _pengemudi!;
}