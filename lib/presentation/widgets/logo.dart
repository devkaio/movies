import 'package:flutter/widgets.dart';
import 'package:movies/common/extensions/size_extensions.dart';

class Logo extends StatelessWidget {
  final double height;

  const Logo({
    Key? key,
    required this.height,
  })  : assert(height > 0, "height must be greater than 0"),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://raw.githubusercontent.com/TechieBlossom/movie_app_tutorial/5_homescreen_carousel/assets/pngs/logo.png",
      height: height.h,
    );
  }
}
