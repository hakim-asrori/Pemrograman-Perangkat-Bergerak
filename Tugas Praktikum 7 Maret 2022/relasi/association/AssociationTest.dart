import 'Dosen.dart';
import 'Mahasiswa.dart';

void main(List<String> args) {
  Dosen dosen1 = Dosen("9090");
  Dosen dosen2 = Dosen("9191");

  Mahasiswa mahasiswa1 = Mahasiswa("1212", dosen1);
  Mahasiswa mahasiswa2 = Mahasiswa("2323", dosen1);
  
  Mahasiswa mahasiswa3 = Mahasiswa("3434", dosen2);
  Mahasiswa mahasiswa4 = Mahasiswa("4545", dosen2);

  dosen1.addMahasiswaWali(mahasiswa1);
  dosen1.addMahasiswaWali(mahasiswa2);

  dosen2.addMahasiswaWali(mahasiswa3);
  dosen2.addMahasiswaWali(mahasiswa4);

  dosen1.showMahasiswaWali();
  dosen2.showMahasiswaWali();
}