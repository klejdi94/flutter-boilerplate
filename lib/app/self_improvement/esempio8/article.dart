class Article {
  String title;
  String author;
  String content;

  Article({
    this.title,
    this.author,
    this.content,
  });

  factory Article.fromData(dynamic article) {
    return Article(
        title: article["title"],
        author: article["author"],
        content: article["content"]);
  }
}
