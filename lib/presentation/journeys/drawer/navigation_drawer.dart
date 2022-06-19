import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/common/constants/languages.dart';
import 'package:movies/common/constants/size_constants.dart';
import 'package:movies/common/extensions/size_extensions.dart';
import 'package:movies/common/extensions/string_extensions.dart';
import 'package:movies/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:movies/presentation/journeys/drawer/navigation_expanded_list_item.dart';
import 'package:movies/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:movies/presentation/widgets/logo.dart';

import '../../../common/constants/translation_constants.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.dimen_300.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 4,
          ),
        ],
      ),
      child: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: Sizes.dimen_8.h,
              bottom: Sizes.dimen_18.h,
              left: Sizes.dimen_8.w,
              right: Sizes.dimen_8.w,
            ),
            child: Logo(height: Sizes.dimen_25.h),
          ),
          NavigationListItem(
            title: TranslationConstants.favoriteMovie.t(context),
            onPressed: () {},
          ),
          NavigationExpandedListItem(
            title: TranslationConstants.language.t(context),
            children: Languages.languages.map((e) => e.value).toList(),
            onPressed: (index) {
              BlocProvider.of<LanguageBloc>(context)
                  .add(ToggleLanguageEvent(Languages.languages[index]));
            },
          ),
          NavigationListItem(
            title: TranslationConstants.feedback.t(context),
            onPressed: () {},
          ),
          NavigationListItem(
            title: TranslationConstants.about.t(context),
            onPressed: () {},
          ),
        ],
      )),
    );
  }
}
