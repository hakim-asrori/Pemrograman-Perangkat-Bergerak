import 'package:firebase_cloud_messaging_tugas/constants/firebase_helper.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
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

  _updateDataNotification(String message) =>
      setState(() => dataNotification = message);
  _updateTitleNotification(String message) =>
      setState(() => titleNotification = message);
  _updateBodyNotification(String message) =>
      setState(() => bodyNotification = message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
