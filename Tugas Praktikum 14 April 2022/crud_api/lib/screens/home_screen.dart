import 'dart:convert';

import 'package:crud_api/screens/author_create_screen.dart';
import 'package:crud_api/screens/author_detail_screen.dart';
import 'package:crud_api/screens/author_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String url = 'http://192.168.1.28:3000/api/authors';

  Future<List<dynamic>> getAuthors() async {
    final response = await http.get(Uri.parse(url));
    print(json.decode(response.body));

    return json.decode(response.body);
  }

  Future<void> deleteAuthors(String authorId) async {
    final response = await http.delete(Uri.parse('http://192.168.1.28:3000/api/authors/'+authorId));

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AuthorCreate()));
        } 
      ),
      appBar: AppBar(
        title: Center(child: Text("Authors"))
      ),
      body: FutureBuilder(
        future: getAuthors(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(12.0),
                  height: 180,
                  child: Card(
                    elevation: 8,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AuthorDetail(author: snapshot.data[index])));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0)
                            ),
                            padding: EdgeInsets.all(5),
                            height: 120,
                            width: 120,
                            child: Image.network(
                              snapshot.data[index]['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    snapshot.data[index]['name'],
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(snapshot.data[index]['email'])
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(child: Icon(Icons.edit), onTap: (){
                                          Get.to(AuthorEdit(author: snapshot.data[index],));
                                        },),
                                        GestureDetector(child: Icon(Icons.delete), onTap: () {
                                          deleteAuthors(snapshot.data[index]['id'].toString()).then((value) {
                                            setState(() {});
                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Author successfully deleted!")));
                                          });
                                        },)
                                      ],
                                    ),
                                    Text(snapshot.data[index]['created_at']),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                );
              }
            );
          } else if (snapshot.data == '') {
            return Center(
              child: Text("Harap Tunggu..."),
            );
          } else {
            return Center(
              child: Text("Data Error!!!"),
            );
          }

        }
      ),
    );
  }
}