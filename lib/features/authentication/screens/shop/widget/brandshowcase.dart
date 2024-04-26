import 'package:blood_donor/utils/constants/colors.dart';
import 'package:blood_donor/utils/constants/sizes.dart';
import 'package:blood_donor/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
    child: Container(),
  );
}

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: Container());
  }
}

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.height = 56,
    this.width = 56,
    this.padding = TSizes.sm,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double height, width, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color:
            THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.light,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Image(
          image: isNetworkImage
              ? NetworkImage(image)
              : AssetImage(image) as ImageProvider,
          color: overlayColor),
    );
  }
}
