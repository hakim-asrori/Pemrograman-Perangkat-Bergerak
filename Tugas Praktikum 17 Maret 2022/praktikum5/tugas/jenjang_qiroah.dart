import 'jenjang.dart';

class JenjangQiroah extends Jenjang {
  
  JenjangQiroah(String? nama, num? nilai) : super(nama, nilai);

  @override
  num totalNilai() {
    return (this.nilai! * 10) / 5;
  }  
}