import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'data/core/api_client.dart';
import 'data/data_sources/movie_remote_data_source.dart';
import 'data/repositories/movie_repository_impl.dart';
import 'domain/entities/no_params.dart';
import 'domain/repositories/movie_repository.dart';
import 'domain/usecases/get_trending.dart';

void main() async {
  ApiClient apiClient = ApiClient(Client());
  MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(apiClient);
  MovieRepository movieRepository = MovieRepositoryImpl(dataSource);
  GetTrending getTrending = GetTrending(movieRepository);
  final response = await getTrending(NoParams());
  response.fold(
    (l) {
      print("error");
      print(l);
    },
    (r) {
      print("List of Movies");
      print(r);
    },
  );

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Container()),
    );
  }
}
