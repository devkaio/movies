import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/common/constants/size_constants.dart';
import 'package:movies/common/extensions/size_extensions.dart';
import 'package:movies/presentation/blocs/movie_tabbed_bloc/movie_tabbed_bloc.dart';
import 'package:movies/presentation/journeys/home/movie_tabbed/movie_list_view_builder.dart';
import 'package:movies/presentation/journeys/home/movie_tabbed/movie_tabbed_constants.dart';
import 'package:movies/presentation/journeys/home/movie_tabbed/tab_title_widget.dart';

class MovieTabbedWidget extends StatefulWidget {
  const MovieTabbedWidget({Key? key}) : super(key: key);

  @override
  State<MovieTabbedWidget> createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget>
    with SingleTickerProviderStateMixin {
  MovieTabbedBloc get movieTabbedBloc =>
      BlocProvider.of<MovieTabbedBloc>(context);

  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: currentTabIndex));
  }

  @override
  void dispose() {
    movieTabbedBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
        builder: (context, state) {
      return Padding(
        padding: EdgeInsets.only(top: Sizes.dimen_4.h),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (var i = 0; i < MovieTabbedConstants.movieTabs.length; i++)
                  TabTitleWidget(
                    title: MovieTabbedConstants.movieTabs[i].title,
                    onTap: () => _onTabTabbed(i),
                    isSelected: MovieTabbedConstants.movieTabs[i].index ==
                        state.currentTabIndex,
                  ),
              ],
            ),
            if (state is MovieTabChanged)
              Expanded(child: MovieListViewBuilder(movies: state.movies)),
          ],
        ),
      );
    });
  }

  void _onTabTabbed(int index) {
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: index));
  }
}
