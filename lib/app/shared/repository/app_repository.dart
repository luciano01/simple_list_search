import 'package:dio/dio.dart';
import 'package:simple_list_search/app/shared/models/movie_model.dart';
import 'package:simple_list_search/app/shared/models/user_model.dart';

import 'app_repository_interface.dart';

class AppRepository implements IAppRepository {
  final _dio = Dio();

  @override
  Future<List<UserModel>?> getUsers() async {
    var url = 'https://randomuser.me/api/?results=50';
    final response = await _dio.get(url);
    var data = response.data["results"];
    return UserModel.fromJsonList(data);
  }

  @override
  Future<List<MovieModel>?> searchMovies(String title) async {
    var url =
        'https://api.themoviedb.org/3/search/movie?api_key=API_KEY&language=en-US&query=$title&page=1&include_adult=false';
    final response = await _dio.get(url);
    var data = response.data["results"];
    return MovieModel.fromJsonList(data);
  }
}
