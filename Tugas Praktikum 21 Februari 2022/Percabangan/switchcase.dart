import 'dart:io';

void main() {
  print("LAMPU LALU LINTAS");
  stdout.write("Warna : ");
  var warna = stdin.readLineSync();
  String arti;
  switch (warna) {
    case "merah":
    {
      arti = "Berhenti";
      break;
    }
    case "kuning":
    {
      arti = "Hati-hati";
      break;
    }
    case "hijau":
    {
      arti = "Maju";
      break;
    }
    default: 
    {
      arti = "Gak ada warma itu...!";
    }
  }

  print(arti);
}