import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_setup/screens/home_screen.dart';
import 'package:flutter/material.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _githubController = TextEditingController();
  TextEditingController _twitterController = TextEditingController();
  TextEditingController _articleController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

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

    final article = TextFormField(
      controller: _articleController,
      decoration: InputDecoration(labelText: "Latest Article Publish"),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter latest article published";
        }
        return null;
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
                article,
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
      latest_article_published: _articleController.text,
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
  String? latest_article_published;
  String? location;

  Author({
    this.id = "",
    required this.name,
    required this.email,
    required this.github,
    required this.twitter,
    required this.latest_article_published,
    required this.location,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'github': github,
        'twitter': twitter,
        'latest_article_published': latest_article_published,
        'location': location,
      };

  static Author fromJson(Map<String, dynamic> json) => Author(
      name: json['id'],
      email: json['email'],
      github: json['github'],
      twitter: json['github'],
      latest_article_published: json['latest_article_published'],
      location: json['location']);
}
