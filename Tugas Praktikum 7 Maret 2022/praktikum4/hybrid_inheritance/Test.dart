import 'Dosen.dart';
import 'MahasiswaDalamNegeri.dart';
import 'MahasiswaLuarNegeri.dart';

void main(List<String> args) {
  var mahasiswaDalamNegeri = MahasiswaDalamNegeri('Hakim Asrori', '2003071');
  mahasiswaDalamNegeri.nik = '1234567890';


  var mahasiswaLuarNegeri = MahasiswaLuarNegeri('Ilham Teguhriyadi', '2003077');
  mahasiswaLuarNegeri.passport = '0987654321';

  var dosen = Dosen("Pak Fachrul", "6574839201");

  print("Mahasiswa ${mahasiswaDalamNegeri.nama} dengan nim ${mahasiswaDalamNegeri.nim} merupakan mahasiswa dalam negeri dengan nik ${mahasiswaDalamNegeri.nik}\n");

  print("Mahasiswa ${mahasiswaLuarNegeri.nama} dengan nim ${mahasiswaLuarNegeri.nim} merupakan mahasiswa luar negeri dengan passport ${mahasiswaLuarNegeri.passport}\n");

  print("${dosen.nama} dengan nidn ${dosen.nidn} merupakan dosen di jurusan Teknik Informatika");
}