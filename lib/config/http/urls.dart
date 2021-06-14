final String baseUrlChuck = "https://api.chucknorris.io/";
final String urlChuckRandom = baseUrlChuck + "/jokes/random";

//Genera apiKey dal sito https://newsapi.org/
final String apiKeyAnsa = "API_KEY";

final String baseUrlAnsa = "https://newsapi.org/v2/";
final String urlTopHeadlinesAnsa =
    '$baseUrlAnsa/top-headlines?sources=ansa&apiKey=$apiKeyAnsa';
final String urlEverythingAnsa =
    '$baseUrlAnsa/everything?sources=ansa&apiKey=$apiKeyAnsa';
