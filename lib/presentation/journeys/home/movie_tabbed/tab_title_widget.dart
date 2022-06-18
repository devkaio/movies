import 'package:flutter/material.dart';
import 'package:movies/common/extensions/size_extensions.dart';
import 'package:movies/presentation/themes/theme_color.dart';

import '../../../../common/constants/size_constants.dart';

class TabTitleWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool isSelected;

  const TabTitleWidget({
    Key? key,
    required this.title,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(
              color: isSelected ? AppColor.royalBlue : Colors.transparent,
              width: Sizes.dimen_1.h,
            ),
          ),
        ),
        child: Text(
          title,
          style: isSelected
              ? Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.apply(color: AppColor.royalBlue)
              : Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.apply(color: Colors.white),
        ),
      ),
    );
  }
}
