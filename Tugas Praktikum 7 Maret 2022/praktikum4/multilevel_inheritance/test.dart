import 'sepeda_motor.dart';

void main(List<String> args) {
  SepedaMotor sepedaMotor1 = new SepedaMotor();

  sepedaMotor1.merk = 'Honda';
  sepedaMotor1.bahanBakar = 'Pertalite';
  sepedaMotor1.cc = 255;

  print('Sepeda motor dengan merk ${sepedaMotor1.merk} dan cc ${sepedaMotor1.cc} menggunakan bahan bakar ${sepedaMotor1.bahanBakar}');
  sepedaMotor1.turnLeft();
  sepedaMotor1.turnRight();
}