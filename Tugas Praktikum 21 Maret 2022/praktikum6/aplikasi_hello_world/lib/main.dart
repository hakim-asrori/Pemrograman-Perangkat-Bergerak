import 'package:flutter/material.dart';

void main() {
  runApp(const AplikasiHelloWorld());
}

class AplikasiHelloWorld extends StatelessWidget {
  const AplikasiHelloWorld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Hello World",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Aplikasi Hello World"),
        ),
        body: const Text("Halo Semuanya"),
      ),
    );
  }
}
