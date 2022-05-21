import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String? overview;
  final String releaseDate;
  final String title;
  final String backdropPath;
  final int id;
  final double voteAverage;

  const MovieEntity({
    this.overview,
    required this.releaseDate,
    required this.title,
    required this.backdropPath,
    required this.id,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [id, title];

  @override
  bool? get stringify => true;
}
