import 'jenjang_ibadi.dart';
import 'jenjang_qiroah.dart';
import 'jenjang_tilawah.dart';
import 'jenjang_tilawah_mandiri.dart';

void main(List<String> args) {
  // Nilai 0 - 50
  var jenjangQiroah = JenjangQiroah("Hakim Asrori", 45);
  print(jenjangQiroah.totalNilai().toStringAsFixed(2));

  // Nilai 0 - 30
  var jenjangIbadi = JenjangIbadi("Asep Saepullah", 15);
  print(jenjangIbadi.totalNilai().toStringAsFixed(2));

  // Nilai 0 - 40
  var jenjangTilawah = JenjangTilawah("Suep Muhammad", 28);
  print(jenjangTilawah.totalNilai().toStringAsFixed(2));

  // Nilai 0 - 20
  var jenjangTilawahMandiri = JenjangTilawahMandiri("Aziz Sukarta", 19);
  print(jenjangTilawahMandiri.totalNilai().toStringAsFixed(2));
}