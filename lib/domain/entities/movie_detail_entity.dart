// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class MovieDetailEntity extends Equatable {
  final int id;
  final String title;
  final String releaseDate;
  final String overview;
  final double voteAverage;
  final String posterPath;
  final String backdropPath;

  const MovieDetailEntity({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.overview,
    required this.voteAverage,
    required this.posterPath,
    required this.backdropPath,
  });

  @override
  List<Object?> get props => [id];
}
