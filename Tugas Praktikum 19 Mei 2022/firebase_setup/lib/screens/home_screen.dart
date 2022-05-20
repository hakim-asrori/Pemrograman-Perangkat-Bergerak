import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_setup/screens/authors/create_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Stream<List<Author>> readAuthors() => FirebaseFirestore.instance
      .collection('authors')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Author.fromJson(doc.data())).toList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authors'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => CreateScreen())));
        },
      ),
      resizeToAvoidBottomInset: false,
      body: StreamBuilder(
        stream: readAuthors(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error'),)
          } else if (snapshot.hasData) {
            final authors = snapshot.data;

            return ListView(
              children: [
                ListTile(
                  leading: CircleAvatar(child: Text('${authors}')),
                )
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator(),)
          }

          return Center();
        },
      ),
    );
  }

  Widget buildAuthor(Author author) => ListTile(
        leading: CircleAvatar(child: Text('${author.email}')),
        title: Text('${author.name}'),
      );
}
