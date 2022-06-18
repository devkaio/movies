import 'package:flutter/material.dart';
import 'package:movies/presentation/journeys/drawer/navigation_sub_list_item.dart';
import 'package:movies/presentation/themes/theme_color.dart';

class NavigationExpandedListItem extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final List<String> children;

  const NavigationExpandedListItem({
    Key? key,
    required this.title,
    this.onPressed,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.7),
              blurRadius: 2,
            ),
          ],
        ),
        child: ExpansionTile(
          iconColor: AppColor.royalBlue,
          collapsedIconColor: AppColor.royalBlue,
          title: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.apply(color: Colors.white),
          ),
          children: [
            for (int i = 0; i < children.length; i++)
              NavigationSubListItem(
                title: children[i],
                onPressed: () {},
              ),
          ],
        ),
      ),
    );
  }
}
