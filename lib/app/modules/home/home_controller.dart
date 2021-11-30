import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';
import 'package:simple_list_search/app/shared/models/movie_model.dart';
import 'package:simple_list_search/app/shared/repository/app_repository_interface.dart';

class HomeController extends Disposable {
  final _controllerMovies = BehaviorSubject<List<MovieModel>>();

  final IAppRepository _repository;

  HomeController(this._repository) {
    searchMovieByName(textEditingController.text);
  }
  TextEditingController textEditingController = TextEditingController();

  Stream<List<MovieModel>> get moviesStream => _controllerMovies.stream;
  Sink<List<MovieModel>> get moviesSink => _controllerMovies.sink;

  searchMovieByName(String title) async {
    if (title.isEmpty || title.length == 0) {
      var data = await _repository.searchMovies('2021');
      List<MovieModel> tempList = [];
      for (var movie in data!) {
        tempList.add(movie);
      }
      moviesSink.add(tempList);
    } else {
      var data = await _repository.searchMovies(textEditingController.text);
      List<MovieModel> tempList = [];
      for (var movie in data!) {
        tempList.add(movie);
      }
      moviesSink.add(tempList);
    }
  }

  @override
  void dispose() {
    _controllerMovies.close();
  }
}
