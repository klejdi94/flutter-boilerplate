import 'articleDetailPage.dart';

import 'package:boilerplate/app/self_improvement/esempio11/models/article.dart';
import 'package:boilerplate/app/self_improvement/esempio11/providers/api.dart';
import 'package:flutter/material.dart';

class HistoricNewsPage extends StatelessWidget {
  Widget buildArticle(BuildContext context, Article article) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArticleDetailPage(article),
              ));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: NetworkImage(article.urlToImage),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 16,
            ),
            Text(article.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            SizedBox(
              height: 8,
            ),
            Text(article.content,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13, color: Colors.black54))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: everything(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.done:
            {
              List<Article> articles = snapshot.data as List<Article>;

              return GridView.count(
                padding: EdgeInsets.all(16),
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: List.generate(articles.length, (int index) {
                  return buildArticle(context, articles[index]);
                }),
              );
            }
          default:
            {
              return Center(
                child: Text(
                  "ERRORE",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              );
            }
        }
      },
    );
  }
}
