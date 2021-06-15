import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:boilerplate/app/self_improvement/esempio11/models/article.dart';

class ArticleDetailPage extends StatelessWidget {
  final Article article;
  ArticleDetailPage(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.link),
              onPressed: () {
                launch(article.url);
              })
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Column(
            children: [
              Text("NOTIZIA CORRENTE",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              SizedBox(
                height: 8,
              ),
              Text(article.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    image: NetworkImage(article.urlToImage), fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Text(article.content,
                style: TextStyle(fontSize: 14, color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
