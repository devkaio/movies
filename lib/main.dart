import 'package:flutter/material.dart';
import 'package:movies/di/get_it.dart' as get_it;

import 'domain/entities/no_params.dart';
import 'domain/usecases/get_trending.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await get_it.init();

  GetTrending getTrending = get_it.getItInstance<GetTrending>();

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
