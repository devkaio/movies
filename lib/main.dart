import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies/di/get_it.dart' as get_it;

import 'presentation/widgets/movies_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await get_it.init();

  runApp(const MoviesApp());
}
