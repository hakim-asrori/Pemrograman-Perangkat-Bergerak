import 'book.dart';
import 'special_page.dart';

void main(List<String> args) {
  var spesialPage = SpecialPage();
  var buku = Book();

  buku.title = "Ok";
  print(spesialPage.title);
}