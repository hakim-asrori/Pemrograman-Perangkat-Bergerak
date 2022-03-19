import 'jenjang.dart';

class JenjangIbadi extends Jenjang {
  JenjangIbadi(String? nama, num? nilai) : super(nama, nilai);

  @override
  num totalNilai() {
    return (this.nilai! * 10) / 3;
  }
  
}