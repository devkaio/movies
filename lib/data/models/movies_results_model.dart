import 'dart:convert';

import 'movie_model.dart';

class MoviesResultModel {
  List<MovieModel>? movies;

  MoviesResultModel({this.movies});

  Map<String, dynamic> toMap() {
    return {
      'results': movies?.map((x) => x.toMap()).toList(),
    };
  }

  factory MoviesResultModel.fromMap(Map<String, dynamic> map) {
    return MoviesResultModel(
      movies: map['results'] != null
          ? List<MovieModel>.from(
              map['results']?.map((x) => MovieModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MoviesResultModel.fromJson(String source) =>
      MoviesResultModel.fromMap(json.decode(source));
}
