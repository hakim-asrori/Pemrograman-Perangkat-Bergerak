import 'dart:convert';

import 'package:firebase_cloud_messaging_tugas/views/coba_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_cloud_messaging_tugas/constants/firebase_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Messaging',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dataNotification = "Example Data";
  String titleNotification = "Example Title";
  String bodyNotification = "Example Body";

  @override
  void initState() {
    final firebaseMessaging = FCM();
    firebaseMessaging.setNotification();
    firebaseMessaging.dataControl.stream.listen(_updateDataNotification);
    firebaseMessaging.titleControl.stream.listen(_updateTitleNotification);
    firebaseMessaging.bodyControl.stream.listen(_updateBodyNotification);

    super.initState();
  }

  _updateDataNotification(String message) {
    var temporaryData = jsonDecode(message);
    setState(() => dataNotification = temporaryData['message']);
  }

  _updateTitleNotification(String message) =>
      setState(() => titleNotification = message);
  _updateBodyNotification(String message) =>
      setState(() => bodyNotification = message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CobaPage();
          }));
        },
      ),
      appBar: AppBar(
        title: Text("Firebase Messaging"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  "Title : $titleNotification",
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Body : $bodyNotification",
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Data : $dataNotification",
                  style: TextStyle(fontSize: 25),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
