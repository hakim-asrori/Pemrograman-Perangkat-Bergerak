import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:latihan_shared_preferences/models/user.dart';
import 'package:latihan_shared_preferences/views/admin/v_dashboard.dart';
import 'package:latihan_shared_preferences/views/constants/custom_checkbox.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _teleponController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  Future<bool> _loginProses() async {
    final prefs = await SharedPreferences.getInstance();
    var response = await http
        .post(Uri.parse('http://api.rtq-freelance.my.id/api-v1/login'), body: {
      'no_hp': _teleponController.text,
      'password': _passwordController.text,
    });

    if (response.statusCode == 200) {
      var user = userFromJson(response.body);

      prefs.setString('nama', user.nama.toString());
      prefs.setBool('isLoggedIn', true);

      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login to your \naccount',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff222222)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/accent.png',
                    width: 99,
                    height: 4,
                  )
                ],
              ),
              SizedBox(
                height: 48,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xfff1f1f5),
                            borderRadius: BorderRadius.circular(14.0)),
                        child: TextFormField(
                          controller: _teleponController,
                          decoration: InputDecoration(
                              hintText: 'Telepon',
                              hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff94959b)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Harap masukan telepon!";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xfff1f1f5),
                            borderRadius: BorderRadius.circular(14.0)),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: !passwordVisible,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff94959b),
                            ),
                            suffixIcon: IconButton(
                                onPressed: togglePassword,
                                icon: Icon(passwordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined)),
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Harap masukan password!";
                            }
                            return null;
                          },
                        ),
                      )
                    ],
                  )),
              SizedBox(
                height: 32,
              ),
              Container(
                height: 56,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(14.0)),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _loginProses().then((value) {
                          if (value == true) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DashboardPage();
                            }));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Login Gagal!')));
                          }
                        });
                      }
                    },
                    borderRadius: BorderRadius.circular(14.0),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
