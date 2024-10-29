import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '/core/constant/asset_images.dart';
import '/core/constant/constants.dart';

// ignore: must_be_immutable
class AppLogo extends StatelessWidget {
  double height;
  double width;
  double? clipRRectcircular;

  int type;

  AppLogo(
      {Key? key,
      required this.height,
      required this.width,
      this.clipRRectcircular,
      required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    clipRRectcircular ??= 0;

    type = Constants.LOGO_FILE_TYPE;

    switch (type) {
      case Constants.LOGO_FILE_TYPE:
        {
          // PNG
          return ClipRRect(
            borderRadius: BorderRadius.circular(clipRRectcircular!),
            child: Image.asset(
              AssetImages.sadeem_logo,
              height: height,
              width: width,
            ),
          );
        }

      case Constants.LOGO_SVG_TYPE:
        {
          return ClipRRect(
            borderRadius: BorderRadius.circular(clipRRectcircular!),
            child: SvgPicture.asset(
              AssetImages.sadeem_logo,
              width: width,
            ),
          );
        }
    }

    return SvgPicture.asset(AssetImages.sadeem_logo);
  }
}
