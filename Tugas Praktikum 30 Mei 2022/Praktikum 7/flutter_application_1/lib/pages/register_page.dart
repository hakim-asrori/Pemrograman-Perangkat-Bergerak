import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color.dart';
import 'package:flutter_application_1/pages/login_page.dart';

class RegisterPage extends StatelessWidget {
  static const routeName = "/registerPage";

  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: ColorPallete.primaryColor,
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              Center(
                child: Column(
                  children: <Widget>[
                    _iconRegister(),
                    _titleDescription(),
                    _textField(),
                    _buildButton(context),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

Widget _iconRegister() {
  return Image.asset(
    'assets/images/icon_register.png',
    width: 150.0,
    height: 150.0,
  );
}

Widget _titleDescription() {
  return Column(
    children: const <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 16),
      ),
      Text(
        "Registration",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 12),
      ),
      Text(
        "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Libero nam facilis dolor debitis nesciunt corrupti ipsam, aliquam delectus possimus hic.",
        style: TextStyle(fontSize: 12, color: Colors.white),
        textAlign: TextAlign.center,
      )
    ],
  );
}

Widget _textField() {
  return Column(
    children: <Widget>[
      const Padding(padding: EdgeInsets.only(top: 12)),
      TextFormField(
        decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: ColorPallete.underlineTextField, width: 1.5)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3)),
            hintText: "Username",
            hintStyle: TextStyle(color: ColorPallete.hintColor)),
        style: const TextStyle(color: Colors.white),
        autofocus: false,
      ),
      const Padding(padding: EdgeInsets.only(top: 12)),
      TextFormField(
        decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: ColorPallete.underlineTextField, width: 1.5)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3)),
            hintText: "Password",
            hintStyle: TextStyle(color: ColorPallete.hintColor)),
        style: const TextStyle(color: Colors.white),
        autofocus: false,
        obscureText: true,
      ),
      const Padding(padding: EdgeInsets.only(top: 12)),
      TextFormField(
        decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: ColorPallete.underlineTextField, width: 1.5)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3)),
            hintText: "Confirm Password",
            hintStyle: TextStyle(color: ColorPallete.hintColor)),
        style: const TextStyle(color: Colors.white),
        autofocus: false,
        obscureText: true,
      )
    ],
  );
}

Widget _buildButton(BuildContext context) {
  return Column(
    children: <Widget>[
      const Padding(padding: EdgeInsets.only(top: 16)),
      InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Register Successfully!!!")));
          Navigator.pop(context);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: const Text(
            "Register",
            style: TextStyle(color: ColorPallete.primaryColor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      const Padding(padding: EdgeInsets.only(top: 16)),
      const Text(
        'or',
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
      const Padding(padding: EdgeInsets.only(top: 16)),
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const LoginPage();
          }));
        },
        child: const Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ],
  );
}
