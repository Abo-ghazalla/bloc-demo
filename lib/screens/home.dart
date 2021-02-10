import 'package:bloc_api/screens/all_articles_screen/all_articles.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Bloc"),
      ),
      body: Center(
        child: FlatButton(
          child: Text("GO"),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => AllArticles()));
          },
        ),
      ),
    );
  }
}
