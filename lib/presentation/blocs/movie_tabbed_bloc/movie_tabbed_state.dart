part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedState extends Equatable {
  final int currentTabIndex;

  const MovieTabbedState({required this.currentTabIndex});

  @override
  List<Object> get props => [currentTabIndex];
}

class MovieTabbedInitial extends MovieTabbedState {
  const MovieTabbedInitial({int currentTabIndex = 0})
      : super(currentTabIndex: currentTabIndex);
}

class MovieTabChanged extends MovieTabbedState {
  final List<MovieEntity> movies;

  const MovieTabChanged({
    required this.movies,
    required int currentTabIndex,
  }) : super(currentTabIndex: currentTabIndex);

  @override
  List<Object> get props => [currentTabIndex, movies];
}

class MovieTabLoadError extends MovieTabbedState {
  final AppErrorType errorType;

  const MovieTabLoadError({
    required this.errorType,
    required super.currentTabIndex,
  });
}
