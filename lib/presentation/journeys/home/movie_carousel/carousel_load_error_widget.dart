// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movies/common/constants/translation_constants.dart';
import 'package:movies/common/extensions/string_extensions.dart';
import 'package:movies/domain/entities/app_error.dart';
import 'package:movies/presentation/blocs/movie_bloc/movie_carousel_bloc.dart';
import 'package:movies/presentation/widgets/button.dart';
import 'package:wiredash/wiredash.dart';

class CarouselLoadErrorWidget extends StatelessWidget {
  final AppErrorType errorType;
  final MovieCarouselBloc bloc;

  const CarouselLoadErrorWidget({
    Key? key,
    required this.errorType,
    required this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          errorType == AppErrorType.api
              ? TranslationConstants.somethingWentWrong.t(context)
              : TranslationConstants.checkNetwork.t(context),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        ButtonBar(
          children: [
            Button(
              buttonText: TranslationConstants.retry,
              onPressed: () => bloc.add(const CarouselLoadEvent()),
            ),
            Button(
              buttonText: TranslationConstants.feedback,
              onPressed: () => Wiredash.of(context)?.show(),
            )
          ],
        ),
      ],
    );
  }
}
