import 'jenjang.dart';

class JenjangTilawahMandiri extends Jenjang{
  JenjangTilawahMandiri(String? nama, num? nilai) : super(nama, nilai);

  @override
  num totalNilai() {
    return (this.nilai! * 10) / 2;
  }
  
}