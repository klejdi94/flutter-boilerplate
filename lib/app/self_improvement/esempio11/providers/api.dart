import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:boilerplate/config/http/urls.dart';
import 'package:boilerplate/app/self_improvement/esempio11/models/article.dart';

Future<List<Article>> topHeadlined() async {
  final response = await http.get(Uri.parse(urlTopHeadlinesAnsa));

  List<dynamic> articles = json.decode(response.body)["articles"];
  return Future.wait(
      articles.map((article) async => Article.fromData(article)));
}

Future<List<Article>> everything() async {
  final response = await http.get(Uri.parse(urlEverythingAnsa));

  List<dynamic> articles = json.decode(response.body)["articles"];
  return Future.wait(
      articles.map((article) async => Article.fromData(article)));
}
