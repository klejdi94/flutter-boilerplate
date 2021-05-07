import 'dart:async';

import 'package:boilerplate/app/model/chuck_norris.dart';
import 'package:boilerplate/app/services/chuck_norris_service.dart';
import 'package:boilerplate/config/http/response.dart';


class ChuckNorrisController{
  ChuckNorrisRepository _chuckRepository;
  StreamController _chuckDataController;

  StreamSink<Response<ChuckNorris>> get chuckDataSink =>
      _chuckDataController.sink;

  Stream<Response<ChuckNorris>> get chuckDataStream =>
      _chuckDataController.stream;


  ChuckNorrisController() {
    _chuckDataController = StreamController<Response<ChuckNorris>>();
    _chuckRepository = ChuckNorrisRepository();
    fetchChuckyJoke();
  }

  fetchChuckyJoke() async {
    chuckDataSink.add(Response.loading('Getting A Chucky Joke!'));
    try {
      ChuckNorris chuckJoke = await _chuckRepository.fetchChuckyJoke();
      chuckDataSink.add(Response.completed(chuckJoke));
    } catch (e) {
      chuckDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _chuckDataController?.close();
  }

}