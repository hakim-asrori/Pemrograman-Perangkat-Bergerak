import 'lingkaran.dart';
import 'segitiga.dart';

void main(List<String> args) {
  var segitiga = new Segitiga.panjang(10);
  segitiga.lebar = 2;
  segitiga.sisiMiring = 15;

  print('Segitiga dengan panjang ${segitiga.panjang} dan lebar ${segitiga.lebar} memiliki sisi miring ${segitiga.sisiMiring}');

  var lingkaran = new Lingkaran.lebar(8);
  lingkaran.panjang = 10;
  lingkaran.jariJari = 5;
  
  print('Lingkaran dengan panjang ${lingkaran.panjang} dan lebar ${lingkaran.lebar} memiliki jari-jari ${lingkaran.jariJari}');
}