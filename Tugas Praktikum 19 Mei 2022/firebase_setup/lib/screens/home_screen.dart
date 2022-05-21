import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_setup/screens/authors/create_screen.dart';
import 'package:firebase_setup/screens/authors/detail_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Authors'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => CreateScreen())));
        },
      ),
      body: StreamBuilder<List<Author>>(
        stream: readAuthors(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error'),
            );
          } else if (snapshot.hasData) {
            final authors = snapshot.data!;

            // print(authors);
            return ListView(
              children: authors.map(buildAuthor).toList(),
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

  Stream<List<Author>> readAuthors() => FirebaseFirestore.instance
      .collection('authors')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Author.fromJson(doc.data())).toList());

  Widget buildAuthor(Author author) {
    return ListTile(
      leading: CircleAvatar(child: Text(author.age.toString())),
      title: Text(author.name.toString()),
      subtitle: Text(author.email.toString()),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              id: author.id.toString(),
            ),
          ),
        );
      },
    );
  }
}
