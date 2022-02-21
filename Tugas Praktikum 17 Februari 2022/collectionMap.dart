void main() {
  var mahasiswa = <int, String> {
    1: "Fulan",
    2: "Fulanah",
  };
  print(mahasiswa[1]);

  Map nilai = {'Joko': 89, 'Udin': 90};
  print(nilai);
  
  var mataKuliah = {1: "PBO", 2: "PPB"};
  print(mataKuliah[2]);

  var email = new Map();
  email[1] = 'fulan@gmail.com';
  email[2] = 'fulanah@gmail.com';
  print(email);
}