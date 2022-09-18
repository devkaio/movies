// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movie_carousel_bloc.dart';

abstract class MovieCarouselState extends Equatable {
  const MovieCarouselState();

  @override
  List<Object> get props => [];
}

class MovieCarouselInitial extends MovieCarouselState {}

class MovieCarouselError extends MovieCarouselState {
  final AppErrorType errorType;

  const MovieCarouselError(
    this.errorType,
  );
}

class MovieCarouselLoaded extends MovieCarouselState {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselLoaded({
    required this.movies,
    required this.defaultIndex,
  }) : assert(defaultIndex >= 0, "defaultIndex cannot be less than 0");

  @override
  List<Object> get props => [movies, defaultIndex];
}
