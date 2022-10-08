import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../common/constants/size_constants.dart';
import '../../../common/extensions/num_extensions.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../../common/screenutil/screenutil.dart';
import '../../../data/core/api_constants.dart';
import '../../../domain/entities/movie_detail_entity.dart';
import '../../themes/theme_color.dart';
import 'movie_detail_app_bar.dart';

class BigPoster extends StatelessWidget {
  final MovieDetailEntity movie;

  const BigPoster({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).primaryColor.withOpacity(0.3),
                Theme.of(context).primaryColor,
              ],
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
            width: ScreenUtil().screenWidth,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: ListTile(
            title: Text(
              movie.title,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.apply(color: Colors.white),
            ),
            subtitle: Text(
              movie.overview,
              style: Theme.of(context).textTheme.subtitle1?.apply(
                    color: Colors.grey,
                  ),
            ),
            trailing: Text(
              movie.voteAverage.convertToPercentageString(),
              style: Theme.of(context).textTheme.headline6?.apply(
                    color: AppColor.violet,
                  ),
            ),
          ),
        ),
        Positioned(
          left: Sizes.dimen_16.w,
          right: Sizes.dimen_16.w,
          top: ScreenUtil().statusBarHeight + Sizes.dimen_4.h,
          child: const MovieDetailAppBar(),
        ),
      ],
    );
  }
}
