import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:latihan_shared_preferences/models/detail_user.dart';
import 'package:latihan_shared_preferences/models/user.dart';
import 'package:latihan_shared_preferences/views/auth/v_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String? _nama;

  void getPrefs() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      _nama = prefs.getString('nama');
    });
  }

  void logout() async {
    var prefs = await SharedPreferences.getInstance();

    setState(() {
      prefs.remove('nama');
    });

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => LoginPage(),
      ),
      (route) => false,
    );
  }

  @override
  void initState() {
    getPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: logout, icon: Icon(Icons.logout))],
      ),
      body: Center(
        child: Text("Selamat Datang ${_nama}"),
      ),
    );
  }
}
