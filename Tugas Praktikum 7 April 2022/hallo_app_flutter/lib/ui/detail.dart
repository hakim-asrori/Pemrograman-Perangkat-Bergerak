import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  String pesan;

  Detail(this.pesan);

  @override
  State<Detail> createState() => _DetailState(pesan);
}

class _DetailState extends State<Detail> {
  String pesan;
  
  _DetailState(this.pesan);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(pesan),
            ElevatedButton(
              onPressed: () { 
                Navigator.pop(context);
              },
              child: Text('Kembali'),
            )
          ],
        ),
      ),
    );
  }
}