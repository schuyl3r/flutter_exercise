import 'package:flutter/material.dart';
import 'package:part2_advanced/model/post_model.dart';

class PostDetail extends StatelessWidget {
  const PostDetail({Key? key, required this.e}) : super(key: key);
  final PostModel e;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(children: <Widget>[
            const SizedBox(height: 20.0),
            Text("User ID: ${e.userId}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("ID: ${e.id}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 40.0),
            Text("Title: ${e.title}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 40.0),
            Text("Body: ${e.body}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ])),
    );
  }
}
