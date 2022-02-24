void main() {
  var a = 15;
  var b = 21;
  var hasil = calculate(a, b);
  print(hasil);
}

int calculate(var angkaPertama, var angkaKedua) {
  var hasilPerhitungan;
  hasilPerhitungan = angkaPertama * angkaKedua;
  return hasilPerhitungan;
}