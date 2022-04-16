import 'package:flutter/material.dart';
import 'package:hallo_app_flutter/ui/detail.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String pesan = "Pesan dari halaman home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Detail(pesan);
              }));
            },
            child: Text("Menuju Detail")),
      ),
    );
  }
}
