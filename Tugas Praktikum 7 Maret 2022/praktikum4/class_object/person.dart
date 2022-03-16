class Person {
  String? _nama;

  Person(this._nama);


  set nama(String nama) => _nama = nama;
  String get nama => _nama!;

  String showInfo() {
    return "Halo, saya ${_nama}!";
  }
}