import 'Mahasiswa.dart';
import 'MataKuliah.dart';

void main(List<String> args) {
  MataKuliah mataKuliah1 = new MataKuliah("PBO", "Pemrograman Berorientasi Objek");
  MataKuliah mataKuliah2 = new MataKuliah("PM", "Pemrograman Mobile");
  MataKuliah mataKuliah3 = new MataKuliah("PW1", "Pemrograman Web 1");
  MataKuliah mataKuliah4 = new MataKuliah("BD", "Basis Data");

  Mahasiswa mahasiswa = new Mahasiswa("210934");
  mahasiswa.mengambilMatkul(mataKuliah1);
  mahasiswa.mengambilMatkul(mataKuliah4);

  mahasiswa.showDataMatkul();
}