import 'package:dartz/dartz.dart';
import 'package:movies/domain/entities/app_error.dart';
import 'package:movies/domain/entities/movie_entity.dart';
import 'package:movies/domain/repositories/movie_repository.dart';
import 'package:movies/domain/usecases/usecase.dart';

import '../entities/no_params.dart';

class GetPlayingNow extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository repository;
  GetPlayingNow(
    this.repository,
  );

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams params) async {
    return await repository.getPlayingNow();
  }
}
