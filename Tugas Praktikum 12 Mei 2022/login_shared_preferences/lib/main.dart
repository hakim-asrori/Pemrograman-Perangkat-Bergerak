import 'package:flutter/material.dart';
import 'package:login_shared_preferences/views/auth/v_login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Lato'),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
