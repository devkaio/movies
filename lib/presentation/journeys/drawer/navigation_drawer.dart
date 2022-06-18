import 'package:flutter/material.dart';
import 'package:movies/common/constants/size_constants.dart';
import 'package:movies/common/extensions/size_extensions.dart';
import 'package:movies/presentation/journeys/drawer/navigation_expanded_list_item.dart';
import 'package:movies/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:movies/presentation/widgets/logo.dart';

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
            title: "Favorite Movies",
            onPressed: () {},
          ),
          NavigationExpandedListItem(
            title: "Language",
            children: const ["English", "Portuguese"],
            onPressed: () {},
          ),
          NavigationListItem(
            title: "Feedback",
            onPressed: () {},
          ),
          NavigationListItem(
            title: "About",
            onPressed: () {},
          ),
        ],
      )),
    );
  }
}
