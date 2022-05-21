import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_setup/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _githubController = TextEditingController();
  final _twitterController = TextEditingController();
  final _ageController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final name = TextFormField(
      controller: _nameController,
      decoration: InputDecoration(labelText: "Name"),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter name";
        }
        return null;
      },
    );

    final email = TextFormField(
      controller: _emailController,
      decoration: InputDecoration(labelText: "Email"),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter email";
        }
        return null;
      },
    );

    final github = TextFormField(
      controller: _githubController,
      decoration: InputDecoration(labelText: "Github"),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter github";
        }
        return null;
      },
    );

    final twitter = TextFormField(
      controller: _twitterController,
      decoration: InputDecoration(labelText: "Twitter"),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter twitter";
        }
        return null;
      },
    );

    final age = TextFormField(
      controller: _ageController,
      decoration: InputDecoration(labelText: "Age"),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter age";
        }
        return null;
      },
    );

    final birthday = DateTimeField(
      controller: _birthdayController,
      decoration: InputDecoration(labelText: "Birthday"),
      format: DateFormat('yyyy-MM-dd'),
      onShowPicker: (BuildContext context, DateTime? currentValue) {
        return showDatePicker(
            context: context,
            initialDate: currentValue ?? DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100));
      },
    );

    final location = TextFormField(
      controller: _locationController,
      decoration: InputDecoration(labelText: "Location"),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter location";
        }
        return null;
      },
    );

    final btnSave = ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            saveAuthor().then((value) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Author successfully added!')));
            });
          }
        },
        child: Text('Save'));

    return Scaffold(
        appBar: AppBar(
          title: Text("Add Author"),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                name,
                email,
                github,
                twitter,
                age,
                birthday,
                location,
                SizedBox(
                  height: 20.0,
                ),
                btnSave,
              ]),
        ));
  }

  Future<void> saveAuthor() async {
    final docAuthor = FirebaseFirestore.instance.collection('authors').doc();

    final author = Author(
      id: docAuthor.id,
      name: _nameController.text,
      email: _emailController.text,
      github: _githubController.text,
      twitter: _twitterController.text,
      age: _ageController.text,
      birthday: DateTime.parse(_birthdayController.text),
      location: _locationController.text,
    );

    final json = author.toJson();

    await docAuthor.set(json);
  }
}

class Author {
  String? id;
  String? name;
  String? email;
  String? github;
  String? twitter;
  String? age;
  DateTime? birthday;
  String? location;

  Author({
    this.id = "",
    this.name,
    this.email,
    this.github,
    this.twitter,
    this.age,
    this.birthday,
    this.location,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'github': github,
        'twitter': twitter,
        'age': age,
        'birthday': birthday,
        'location': location,
      };

  static Author fromJson(Map<String, dynamic> json) => Author(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        github: json['github'],
        twitter: json['twitter'],
        age: json['age'],
        birthday: (json['birthday'] as Timestamp).toDate(),
        location: json['location'],
      );
}
