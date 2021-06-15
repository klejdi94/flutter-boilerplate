import 'package:flutter/cupertino.dart';

class Article {
  String title;
  String content;
  String url;
  String urlToImage;

  Article(
      {@required this.title,
      @required this.content,
      @required this.url,
      @required this.urlToImage});

  factory Article.fromData(dynamic data) {
    String title = data["title"];
    String content = data["description"];
    String url = data["url"];
    String urlToImage = data["urlToImage"];

    return Article(
        title: title, content: content, url: url, urlToImage: urlToImage);
  }
}
