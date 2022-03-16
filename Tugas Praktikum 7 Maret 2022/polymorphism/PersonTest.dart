import 'Mahasiswa.dart';
import 'Person.dart';

void main(List<String> args) {
  final person = new Person("Fulan \n");
  person.showInfo();

  final mahasiswa = new Mahasiswa("Fulanah", "09030015");
  mahasiswa.showInfo();
}