import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieapp/models/movie_detail_model.dart';
import 'package:movieapp/models/movie_model.dart';

class ApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";
  static const String popular = "/popular";
  static const String nowPlaying = "/now-playing";
  static const String comingSoon = "/coming-soon";
  static const String idDetail = "/movie?id=";
  /*
  4. /movie?id=:id
  id -> is future value
  */

  static Future<List<MovieModel>> getPopularMovies() async {
    // need to get the information from the http -> it is a async function
    List<MovieModel> popularMovieInstances = [];

    final url = Uri.parse("$baseUrl$popular");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final popularMovies = jsonDecode(response.body);
      for (var movie in popularMovies["results"]) {
        final instance = MovieModel.fromJson(movie);
        popularMovieInstances.add(instance);
      }
      return popularMovieInstances;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getNowMovies() async {
    List<MovieModel> nowMovieInstances = [];

    final url = Uri.parse("$baseUrl$nowPlaying");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final nowMovies = jsonDecode(response.body);
      for (var movie in nowMovies["results"]) {
        final instance = MovieModel.fromJson(movie);
        nowMovieInstances.add(instance);
      }
      return nowMovieInstances;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getComingMovies() async {
    List<MovieModel> comingMovieInstances = [];

    final url = Uri.parse("$baseUrl$comingSoon");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final comingMovies = jsonDecode(response.body);
      for (var movie in comingMovies["results"]) {
        final instance = MovieModel.fromJson(movie);
        comingMovieInstances.add(instance);
      }
      return comingMovieInstances;
    }
    throw Error();
  }

  static Future<MovieDetailModel> getMovieById(int id) async {
    final url = Uri.parse("$baseUrl$idDetail$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movie = jsonDecode(response.body);
      print(response.body);
      return MovieDetailModel.fromJson(movie);
    }
    throw Error();
  }
}
