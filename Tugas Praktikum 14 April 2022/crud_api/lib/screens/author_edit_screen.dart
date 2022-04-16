import 'dart:convert';
import 'dart:io';

import 'package:crud_api/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';

class AuthorEdit extends StatelessWidget {
  final Map author;

  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _githubController = TextEditingController();
  TextEditingController _twitterController = TextEditingController();
  TextEditingController _articleController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  AuthorEdit({required this.author});

  @override
  Widget build(BuildContext context) {
    final name = TextFormField(
      controller: _nameController..text = author['name'],
      decoration: InputDecoration(
        labelText: "Name"
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter name";
        }
        return null;
      },
    );

    final email = TextFormField(
      controller: _emailController..text = author['email'],
      decoration: InputDecoration(
        labelText: "Email"
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter email";
        }
        return null;
      },
    );

    final github = TextFormField(
      controller: _githubController..text = author['github'],
      decoration: InputDecoration(
        labelText: "Github"
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter github";
        }
        return null;
      },
    );

    final twitter = TextFormField(
      controller: _twitterController..text = author['twitter'],
      decoration: InputDecoration(
        labelText: "Twitter"
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter twitter";
        }
        return null;
      },
    );

    final article = TextFormField(
      controller: _articleController..text = author['latest_article_published'],
      decoration: InputDecoration(
        labelText: "Latest Article Publish"
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter latest article published";
        }
        return null;
      },
    );

    final location = TextFormField(
      controller: _locationController..text = author['location'],
      decoration: InputDecoration(
        labelText: "Location"
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter location";
        }
        return null;
      },
    );
    
    final btnUpdate = ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          updateAuthor().then((value) {
            Get.off(HomeScreen());
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Author successfully updated!')));
          });
        }
      }, 
      child: Text('Save')
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Author " + author['name']),
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
              SizedBox(height: 20.0,),
              btnUpdate,
            ]
          ),
      )
    );
  }

  Future<void> updateAuthor() async {
    final response = await http.put(Uri.parse('http://192.168.1.28:3000/api/authors/'+author['id'].toString()), body: {
      'name': _nameController.text,
      'email': _emailController.text,
      'github': _githubController.text,
      'twitter': _twitterController.text,
      'latest_article_published': _articleController.text,
      'location': _locationController.text,
    });

    return json.decode(response.body);
  }
}