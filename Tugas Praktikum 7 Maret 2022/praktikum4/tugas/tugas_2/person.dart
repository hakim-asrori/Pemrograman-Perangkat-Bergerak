class Person {
  String? _nama;

  Person(this._nama);

  String get nama => _nama!;

  void showPerson() {
    print(_nama);
  }
}