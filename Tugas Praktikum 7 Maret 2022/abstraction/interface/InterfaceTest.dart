import 'MahasiswaController.dart';

void main(List<String> args) {
  final mhs = new MahasiswaController();
  mhs.create();
  mhs.read();
  mhs.update();
  mhs.delete();
}