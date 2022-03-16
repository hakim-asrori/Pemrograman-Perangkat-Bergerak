import 'bangun_datar.dart';

class Lingkaran extends BangunDatar {
  int? _jariJari;

  Lingkaran.lebar(int? lebar) : super.lebar(lebar);

  set jariJari(int jarijari) => _jariJari = jarijari;

  int get jariJari => _jariJari!;
}