import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_setup/screens/authors/create_screen.dart';
import 'package:firebase_setup/screens/authors/detail_screen.dart';
import 'package:firebase_setup/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditScreen extends StatefulWidget {
  final String id;

  EditScreen({required this.id});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
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
    Widget name(String name) => TextFormField(
          controller: _nameController..text = name,
          decoration: InputDecoration(labelText: "Name"),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter name";
            }
            return null;
          },
        );

    Widget email(String email) => TextFormField(
          controller: _emailController..text = email,
          decoration: InputDecoration(labelText: "Email"),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter email";
            }
            return null;
          },
        );

    Widget github(String github) => TextFormField(
          controller: _githubController..text = github,
          decoration: InputDecoration(labelText: "Github"),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter github";
            }
            return null;
          },
        );

    Widget twitter(String twitter) => TextFormField(
          controller: _twitterController..text = twitter,
          decoration: InputDecoration(labelText: "Twitter"),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter twitter";
            }
            return null;
          },
        );

    Widget age(String age) => TextFormField(
          controller: _ageController..text = age,
          decoration: InputDecoration(labelText: "Age"),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter age";
            }
            return null;
          },
        );

    Widget location(String location) => TextFormField(
          controller: _locationController..text = location,
          decoration: InputDecoration(labelText: "Location"),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter location";
            }
            return null;
          },
        );

    Widget birthday(DateTime birthday) => DateTimeField(
          controller: _birthdayController
            ..text = DateFormat('yyyy-MM-dd').format(birthday),
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

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Author"),
      ),
      body: FutureBuilder<Author?>(
        future: readAuthor(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final author = snapshot.data;

            return author == null
                ? Center(child: Text("No Author"))
                : ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(left: 24.0, right: 24.0),
                    children: [
                      name(author.name.toString()),
                      email(author.email.toString()),
                      github(author.github.toString()),
                      twitter(author.twitter.toString()),
                      age(author.age.toString()),
                      birthday(author.birthday!),
                      location(author.location.toString()),
                      SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final docAuthor = FirebaseFirestore.instance
                              .collection('authors')
                              .doc("${author.id}");

                          docAuthor.update({
                            "name": _nameController.text,
                            "email": _emailController.text,
                            "github": _githubController.text,
                            "twitter": _twitterController.text,
                            "age": _ageController.text,
                            "birthday":
                                DateTime.parse(_birthdayController.text),
                            "location": _locationController.text,
                          });

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailScreen(id: author.id.toString());
                          }));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Author successfully updated!')));
                        },
                        child: Text("Save"),
                      )
                    ],
                  );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<void> saveAuthor(String id) async {
    final docAuthor = FirebaseFirestore.instance.collection('authors').doc(id);

    docAuthor.update({
      "name": _nameController.text,
      "email": _emailController.text,
      "github": _githubController.text,
      "twitter": _twitterController.text,
      "age": _ageController.text,
      "age": _ageController.text,
      "location": _locationController.text,
    });

    // await docAuthor.update(json);
  }

  Future<Author?> readAuthor() async {
    final docUser =
        FirebaseFirestore.instance.collection('authors').doc(widget.id);
    final snapshot = await docUser.get();

    if (snapshot.exists) {
      return Author.fromJson(snapshot.data()!);
    }
    return null;
  }
}
