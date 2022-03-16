import 'motor.dart';
import 'pengemudi.dart';

void main(List<String> args) {
  var pengemudi1 = new Pengemudi("Asep Saepullah");
  var motor1 = new Motor(255);
  motor1.pengemudi = pengemudi1;

  print("${motor1.pengemudi.nama} sedang mengendarai motor dengan cc ${motor1.cc}");

  var motor2 = new Motor(254);
  var pengemudi2 = new Pengemudi("Hakim Asrori");
  pengemudi2.motor = motor2;

  print("${pengemudi2.nama} sedang mengendarai motor dengan cc ${pengemudi2.motor.cc}");
}