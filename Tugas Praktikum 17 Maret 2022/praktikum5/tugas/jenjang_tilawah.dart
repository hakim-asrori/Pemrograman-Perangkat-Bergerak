import 'jenjang.dart';

class JenjangTilawah extends Jenjang{
  JenjangTilawah(String? nama, num? nilai) : super(nama, nilai);

  @override
  num totalNilai() {
    return (this.nilai! * 10) / 4;
  }
  
}