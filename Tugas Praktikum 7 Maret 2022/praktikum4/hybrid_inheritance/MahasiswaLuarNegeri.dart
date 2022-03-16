import 'Mahasiswa.dart';

class MahasiswaLuarNegeri extends Mahasiswa {
  String? _passport;
  
  MahasiswaLuarNegeri(String? nama, String? nim) : super(nama, nim);

  set passport(String passport) => _passport = passport;

  String get passport => _passport!;
}