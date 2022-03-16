import 'Mahasiswa.dart';

class MahasiswaDalamNegeri extends Mahasiswa {
  String? _nik;

  MahasiswaDalamNegeri(String? nama, String? nim) : super(nama, nim);

  set nik(String nik) => _nik = nik;

  String get nik => _nik!;
}