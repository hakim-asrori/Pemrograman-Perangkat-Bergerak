abstract class BangunDatar {
  int? _panjang;
  int? _lebar;

  BangunDatar.panjang(this._panjang);

  int get panjang => _panjang!;
  set panjang(int panjang) => _panjang = panjang;

  BangunDatar.lebar(this._lebar);
  int get lebar => _lebar!;
  set lebar(int lebar) => _lebar = lebar;
}