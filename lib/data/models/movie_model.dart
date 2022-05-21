import 'dart:convert';

import 'package:movies/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final bool? adult;
  final List<int>? genreIds;
  final String? originalLanguage;
  final String? originalTitle;
  final int? voteCount;
  final bool? video;
  final String? posterPath;
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
    this.posterPath,
    this.popularity,
    this.mediaType,
  });

  Map<String, dynamic> toMap() {
    return {
      'overview': overview,
      'releaseDate': releaseDate,
      'title': title,
      'adult': adult,
      'backdropPath': backdropPath,
      'genreIds': genreIds,
      'originalLanguage': originalLanguage,
      'originalTitle': originalTitle,
      'id': id,
      'voteCount': voteCount,
      'video': video,
      'voteAverage': voteAverage,
      'posterPath': posterPath,
      'popularity': popularity,
      'mediaType': mediaType,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      overview: map['overview'],
      releaseDate: map['releaseDate'] ?? '',
      title: map['title'] ?? '',
      adult: map['adult'],
      backdropPath: map['backdropPath'] ?? '',
      genreIds: List<int>.from(map['genreIds']),
      originalLanguage: map['originalLanguage'],
      originalTitle: map['originalTitle'],
      id: map['id']?.toInt() ?? 0,
      voteCount: map['voteCount']?.toInt(),
      video: map['video'],
      voteAverage: map['voteAverage']?.toDouble() ?? 0.0,
      posterPath: map['posterPath'],
      popularity: map['popularity']?.toDouble(),
      mediaType: map['mediaType'],
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
