void main() {
  var waktuSekarang = 17;
  var dia = "Nur Budi Nugraha";
  if (waktuSekarang <= 10) {
    play(dia);
  } if (waktuSekarang == 17) {
    eat(dia);
  } else {
    play(dia);
  }
}

void play(var nama) {
  print('$nama sedang makan.');
}

void eat(var nama) {
  print('$nama sedang main.');
}