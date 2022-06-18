import 'dart:convert';

import 'package:movies/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final bool? adult;
  final List<int>? genreIds;
  final String? originalLanguage;
  final String? originalTitle;
  final int? voteCount;
  final bool? video;
  @override
  final double? popularity;
  final String? mediaType;

  const MovieModel({
    super.overview,
    required super.releaseDate,
    required super.title,
    this.adult,
    required super.backdropPath,
    this.genreIds,
    this.originalLanguage,
    this.originalTitle,
    required super.id,
    this.voteCount,
    this.video,
    required super.voteAverage,
    required super.posterPath,
    this.popularity,
    this.mediaType,
  });

  Map<String, dynamic> toMap() {
    return {
      'overview': overview,
      'release_date': releaseDate,
      'title': title,
      'adult': adult,
      'backdrop_path': backdropPath,
      'genre_ids': genreIds,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'id': id,
      'vote_count': voteCount,
      'video': video,
      'vote_average': voteAverage,
      'poster_path': posterPath,
      'popularity': popularity,
      'media_type': mediaType,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      overview: map['overview'],
      releaseDate: map['release_date'] ?? '',
      title: map['title'] ?? '',
      adult: map['adult'],
      backdropPath: map['backdrop_path'] ?? '',
      genreIds: List<int>.from(map['genre_ids']),
      originalLanguage: map['original_language'],
      originalTitle: map['original_title'],
      id: map['id']?.toInt() ?? 0,
      voteCount: map['vote_count']?.toInt(),
      video: map['video'],
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      posterPath: map['poster_path'],
      popularity: map['popularity']?.toDouble(),
      mediaType: map['media_type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MovieModel(overview: $overview, releaseDate: $releaseDate, title: $title, adult: $adult, backdropPath: $backdropPath, genreIds: $genreIds, originalLanguage: $originalLanguage, originalTitle: $originalTitle, id: $id, voteCount: $voteCount, video: $video, voteAverage: $voteAverage, posterPath: $posterPath, popularity: $popularity, mediaType: $mediaType)';
  }
}
