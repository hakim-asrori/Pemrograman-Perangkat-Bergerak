import 'package:flutter/material.dart';

class AuthorDetail extends StatelessWidget {
  // const AuthorDetail({ Key? key }) : super(key: key);

  final Map author;

  AuthorDetail({required this.author});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Author Detail'),
      ),
      body: Column(
        children: [
          Container(
            // child: Image.asset(
            //   'assets/mpm.png', 
            //   fit: BoxFit.cover
            // ),
            child: Image.network(
              author['image'],
              fit: BoxFit.cover,
            )
          ),
          SizedBox(
            height: 20
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  author['email'],
                  style: TextStyle(
                    fontSize: 22
                  )
                ),
                Row(
                  children: [
                    Icon(Icons.edit),
                    Icon(Icons.delete)
                  ],
                )
              ],
            ),
          ),
          Text(
            author['created_at']
          )
        ]
      ),
    );
  }
}