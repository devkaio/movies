import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/entities/movie_entity.dart';

part 'movie_backdrop_event.dart';
part 'movie_backdrop_state.dart';

class MovieBackdropBloc extends Bloc<MovieBackdropEvent, MovieBackdropState> {
  MovieBackdropBloc() : super(MovieBackdropInitial()) {
    on<MovieBackdropChangedEvent>(
        (event, emit) => emit(MovieBackdropChanged((event).movie)));
  }

  // @override
  // Stream<MovieBackdropState> mapEventToState(MovieBackdropEvent event) async* {
  //   yield MovieBackdropChanged((event as MovieBackdropChangedEvent).movie);
  // }

}
