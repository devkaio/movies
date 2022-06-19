import 'package:flutter/material.dart';
import 'package:movies/common/constants/size_constants.dart';
import 'package:movies/common/extensions/size_extensions.dart';
import 'package:movies/common/extensions/string_extensions.dart';
import 'package:movies/presentation/themes/theme_color.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const Button({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Ink(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              AppColor.royalBlue,
              AppColor.violet,
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(
            Sizes.dimen_16.w,
          )),
        ),
        child: InkWell(
          borderRadius: BorderRadius.all(
            Radius.circular(
              Sizes.dimen_16.w,
            ),
          ),
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Sizes.dimen_32.w, vertical: Sizes.dimen_8.h),
            child: Text(
              buttonText.t(context),
              style: Theme.of(context).textTheme.button?.apply(
                    color: Colors.white,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
