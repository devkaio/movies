import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movies/common/constants/languages.dart';
import 'package:movies/di/get_it.dart';
import 'package:movies/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:movies/presentation/themes/theme_color.dart';

import '../app_localizations.dart';
import '../journeys/home/home_screen.dart';

class MoviesApp extends StatefulWidget {
  const MoviesApp({Key? key}) : super(key: key);

  @override
  State<MoviesApp> createState() => _MoviesAppState();
}

class _MoviesAppState extends State<MoviesApp> {
  late LanguageBloc _languageBloc;
  @override
  void initState() {
    super.initState();
    _languageBloc = getItInstance<LanguageBloc>();
  }

  @override
  void dispose() {
    _languageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LanguageBloc>.value(
      value: _languageBloc,
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          if (state is LanguageLoaded) {
            return MaterialApp(
              title: "Movies",
              theme: ThemeData(
                unselectedWidgetColor: AppColor.royalBlue,
                primaryColor: AppColor.vulcan,
                scaffoldBackgroundColor: AppColor.vulcan,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                appBarTheme: const AppBarTheme(elevation: 0),
              ),
              supportedLocales:
                  Languages.languages.map((e) => Locale(e.code)).toList(),
              locale: state.locale,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              home: const HomeScreen(),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
