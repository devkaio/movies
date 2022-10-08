import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/movie_detail_entity.dart';
import '../../../domain/entities/movie_params.dart';
import '../../../domain/usecases/get_movie_detail.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;

  MovieDetailBloc(this.getMovieDetail) : super(MovieDetailInitial()) {
    on<MovieDetailLoadEvent>((event, emit) async {
      final movieDetailEither =
          await getMovieDetail(MovieParams(event.movieId));
      movieDetailEither.fold(
        (l) => emit(MovieDetailError()),
        (r) => emit(MovieDetailLoaded(r)),
      );
    });
  }
}
