import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_setup/screens/authors/create_screen.dart';
import 'package:firebase_setup/screens/authors/edit_screen.dart';
import 'package:firebase_setup/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatelessWidget {
  final String id;

  DetailScreen({required this.id});

  Future<Author?> readAuthor() async {
    final docUser =
        FirebaseFirestore.instance.collection('authors').doc(this.id);
    final snapshot = await docUser.get();

    if (snapshot.exists) {
      return Author.fromJson(snapshot.data()!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Author Detail'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => EditScreen(
                                id: this.id,
                              ))));
                },
                icon: Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  final docAuthor = FirebaseFirestore.instance
                      .collection('authors')
                      .doc(this.id);
                  docAuthor.delete();

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const HomeScreen())));
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Author successfully deleted!')));
                },
                icon: Icon(Icons.delete)),
          ],
        ),
        body: FutureBuilder<Author?>(
          future: readAuthor(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final author = snapshot.data;

              return author == null
                  ? Center(child: Text("No Author"))
                  : buildAuthor(author);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  Widget buildAuthor(Author author) => Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 120,
            width: 120,
            child: CircleAvatar(child: Text(author.age.toString())),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  Text(
                    author.name.toString(),
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    DateFormat('dd MMMM yyyy').format(author.birthday!),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                Card(
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(author.email.toString(),
                            style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Github',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(author.github.toString(),
                            style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Twitter',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(author.twitter.toString(),
                            style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Location',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(author.location.toString(),
                            style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      );
}
