import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:boilerplate/config/http/urls.dart';
import 'package:boilerplate/app/self_improvement/esempio8/article.dart';

class NewsStream {
  //Nel controller viaggerà un tipo T e per questo parametrizziamo lo StreamController<T>
  StreamController<Article> controller;
  Timer timer;

  NewsStream() {
    this.controller = StreamController(
        onListen: startStream,
        onCancel: closeStream,
        onResume: startStream,
        onPause: closeStream);
  }

  Stream<Article> getStream() {
    return controller.stream;
  }

  void startStream() {
    timer = Timer.periodic(Duration(seconds: 5), produce);
  }

  void closeStream() {
    timer.cancel();
  }

  void produce(_) async {
    final response = await http.get(Uri.parse(urlTopHeadlinesAnsa));

    final jsonResponse = jsonDecode(response.body);
    final List<dynamic> dynamicArticles = jsonResponse["articles"];
    var articles =
        dynamicArticles.map((article) => Article.fromData(article)).toList();

    final randomArticleIndex = Random().nextInt(articles.length);

    controller.add(articles[randomArticleIndex]);
  }
}
