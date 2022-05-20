import 'package:flutter/material.dart';
import 'package:latihan_shared_preferences/views/admin/v_dashboard.dart';
import 'package:latihan_shared_preferences/views/auth/v_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool? loggedIn;

  Future<void> getPrefs() async {
    var prefs = await SharedPreferences.getInstance();

    loggedIn = prefs.getBool('isLoggedIn');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Lato'),
      debugShowCheckedModeBanner: false,
      home: (loggedIn == true) ? DashboardPage() : LoginPage(),
    );
  }
}
