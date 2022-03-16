import 'dart:async';
import 'dart:io';

void main(List<String> args) {
  try {
    print("-- Contoh throw DeferredLoadException --");
    throw DeferredLoadException('Ini adalah deffered load exception');
  } on IOException catch (e) {
    print("Muncul hanya ketika ada IOException, $e");
  }catch (e) {
    print(e);
  } finally {
    print("Akhir dari blok try deferred load exception\n");
  }

  try {
    print("-- Contoh throw HttpException --");
    throw HttpException('ini adalah http exception');
  } on HttpException catch (e) {
    print(e);
  } catch (e) {
    print("Pesan ini muncul apabila ada exception selain HttpException");
  } finally {
    print("Akhir dari blok try http exception");
  }
}