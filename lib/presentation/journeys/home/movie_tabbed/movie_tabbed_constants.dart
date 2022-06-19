import 'package:movies/common/constants/translation_constants.dart';
import 'package:movies/presentation/journeys/home/movie_tabbed/tab.dart';

class MovieTabbedConstants {
  static const movieTabs = [
    Tab(index: 0, title: TranslationConstants.popular),
    Tab(index: 1, title: TranslationConstants.now),
    Tab(index: 2, title: TranslationConstants.soon),
  ];
}
