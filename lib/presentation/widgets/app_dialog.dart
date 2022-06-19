import 'package:flutter/material.dart';
import 'package:movies/common/constants/translation_constants.dart';
import 'package:movies/common/extensions/size_extensions.dart';
import 'package:movies/common/extensions/string_extensions.dart';
import 'package:movies/presentation/widgets/button.dart';

import '../../common/constants/size_constants.dart';
import '../themes/theme_color.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final Widget? child;

  const AppDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.buttonText,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.vulcan,
      elevation: Sizes.dimen_32,
      insetPadding: EdgeInsets.all(Sizes.dimen_32.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_8.w)),
      ),
      child: Container(
        padding: EdgeInsets.only(
          top: Sizes.dimen_4.h,
          left: Sizes.dimen_16.w,
          right: Sizes.dimen_16.w,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title.t(context),
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.apply(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.dimen_8),
              child: Text(
                description.t(context),
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.apply(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            if (child != null) child!,
            Button(
              buttonText: TranslationConstants.okay,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
