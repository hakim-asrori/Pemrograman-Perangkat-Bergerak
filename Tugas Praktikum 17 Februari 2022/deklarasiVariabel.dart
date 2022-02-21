enum Status {disetujui, ditolak, diperbaiki, ditinjau}

void main() {
  String nama = "Fulan";
  int umur  = 19;
  double tinggi = 180.43;
  bool isLulus = true;

  var alamat = "Indramayu, Jawa Barat, Indonesia";

  print("Nama saya $nama. umur saya $umur");
  print("Tinggi badan saya sekitar $tinggi cm");
  print("Saat ini saya tinggal di $alamat");
  print("Status proposal Tugas Akhir saya saat ini adalah $Status.disetujui ");
  print("Kelulusan saya tahun ini diharapkan " + isLulus.toString());
}