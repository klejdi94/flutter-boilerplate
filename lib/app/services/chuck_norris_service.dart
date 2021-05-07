import 'package:boilerplate/app/model/chuck_norris.dart';
import 'package:boilerplate/config/http/api_provider.dart';
import 'package:boilerplate/config/http/urls.dart';

class ChuckNorrisRepository {
  ApiProvider _provider = ApiProvider();

  Future<ChuckNorris> fetchChuckyJoke() async {
    final response = await _provider.get(urlChuckRandom);
    return ChuckNorris.fromJson(response);
  }
}