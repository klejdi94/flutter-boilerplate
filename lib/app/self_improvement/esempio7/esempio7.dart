import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Post {
  Post(this.title, this.author, this.link);
  final String title;
  final String author;
  final String link;

  factory Post.fromData(dynamic data) {
    final title = data["title"];
    final author = data["by"];
    final link = data["url"];

    return Post(title, author, link);
  }
}

//Future - http - FutureBuilder - url_launcher - CircularProgressIndicator(loader)
//Accesso api Hacker News usando package http + utilizzo Future e FutureBuilder(per la gestione view della Future) + link esterno  con package url_launcher
class Esempio7 extends StatelessWidget {
  static const String routeName = '/selfImprovement/esempio7';

  Future<List<Post>> downoladData() async {
    final response = await http.get(Uri.parse(
        'https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty'));
    final List<dynamic> postIds = json.decode(response.body);

    return Future.wait(postIds.take(20).map((id) async {
      final response = await http.get(Uri.parse(
          'https://hacker-news.firebaseio.com/v0/item/${id}.json?print=pretty'));
      return Post.fromData(json.decode(response.body));
    }));
  }

  Widget buildList(List<Post> posts) {
    return ListView.separated(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          title: Text(posts[index].title),
          subtitle: Text("by ${posts[index].author}"),
          leading: IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              launch(posts[index].link);
            },
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Container(
          height: 1,
          color: Colors.black12,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF6600),
        title: Text("Hacker News"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: downoladData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.error != null) {
                return Center(
                  child: Icon(Icons.error, size: 30),
                );
              } else {
                Object posts = snapshot.data;
                return buildList((posts as List<Post>));
              }
          }
        },
      ),
    );
  }
}
