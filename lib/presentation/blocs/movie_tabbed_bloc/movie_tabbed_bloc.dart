import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/domain/entities/app_error.dart';
import 'package:movies/domain/entities/movie_entity.dart';
import 'package:movies/domain/usecases/get_coming_soon.dart';
import 'package:movies/domain/usecases/get_playing_now.dart';
import 'package:movies/domain/usecases/get_popular.dart';

import '../../../domain/entities/no_params.dart';

part 'movie_tabbed_event.dart';
part 'movie_tabbed_state.dart';

class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {
  final GetPopular getPopular;
  final GetPlayingNow getPlayingNow;
  final GetComingSoon getComingSoon;

  MovieTabbedBloc({
    required this.getPopular,
    required this.getPlayingNow,
    required this.getComingSoon,
  }) : super(const MovieTabbedInitial()) {
    on<MovieTabChangedEvent>((event, emit) async {
      late Either<AppError, List<MovieEntity>> moviesEither;

      switch (event.currentTabIndex) {
        case 0:
          moviesEither = await getPopular(NoParams());
          break;
        case 1:
          moviesEither = await getPlayingNow(NoParams());
          break;
        case 2:
          moviesEither = await getComingSoon(NoParams());
          break;
      }

      moviesEither.fold(
        (l) => emit(MovieTabLoadError(
          errorType: l.errorType,
          currentTabIndex: event.currentTabIndex,
        )),
        (r) => emit(MovieTabChanged(
          movies: r,
          currentTabIndex: event.currentTabIndex,
        )),
      );
    });
  }
}
