import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/entities/app_error.dart';
import 'package:movies/domain/entities/movie_entity.dart';
import 'package:movies/domain/usecases/get_trending.dart';

import '../../../domain/entities/no_params.dart';
import '../movie_backdrop_bloc/movie_backdrop_bloc.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackdropBloc movieBackdropBloc;

  MovieCarouselBloc({
    required this.getTrending,
    required this.movieBackdropBloc,
  }) : super(MovieCarouselInitial()) {
    on<CarouselLoadEvent>((event, emit) async {
      final moviesEither = await getTrending(NoParams());
      moviesEither.fold(
        (l) => emit(MovieCarouselError(l.errorType)),
        (r) {
          movieBackdropBloc
              .add(MovieBackdropChangedEvent(r[event.defaultIndex]));
          emit(MovieCarouselLoaded(
            movies: r,
            defaultIndex: event.defaultIndex,
          ));
        },
      );
    });
  }

  // @override
  // Stream<MovieCarouselState> mapEventToState(
  //   MovieCarouselEvent event,
  // ) async* {
  //   if (event is CarouselLoadEvent) {
  //     final moviesEither = await getTrending(NoParams());
  //     yield moviesEither.fold(
  //       (l) => MovieCarouselError(),
  //       (r) {
  //         movieBackdropBloc
  //             .add(MovieBackdropChangedEvent(r[event.defaultIndex]));
  //         return MovieCarouselLoaded(
  //           movies: r,
  //           defaultIndex: event.defaultIndex,
  //         );
  //       },
  //     );
  //   }
  // }
}
