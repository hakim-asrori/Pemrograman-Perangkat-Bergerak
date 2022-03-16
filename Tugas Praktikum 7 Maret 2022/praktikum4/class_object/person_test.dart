import 'person.dart';

void main(List<String> args) {
  var person1 = new Person("Fulan");
  print(person1.nama);

  person1.nama = "Joko";
  print(person1.showInfo());
}