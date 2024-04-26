import 'package:blood_donor/common/shadow.dart';
import 'package:blood_donor/common/shapes/t_circular_icon.dart';
import 'package:blood_donor/common/style/product_price.dart';
import 'package:blood_donor/common/style/product_title_text.dart';
import 'package:blood_donor/utils/constants/colors.dart';
import 'package:blood_donor/utils/constants/enums.dart';
import 'package:blood_donor/utils/constants/image_strings.dart';
import 'package:blood_donor/utils/constants/sizes.dart';
import 'package:blood_donor/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TProductCartVertical extends StatelessWidget {
  const TProductCartVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [TshadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: dark ? TColors.darkerGrey : TColors.white),
        child: Column(
          children: [
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            const Padding(
              padding: EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(
                    title: "Fiddle Leaf Fig Topiary",
                    smallSize: true,
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  Column(
                    children: [
                      TBRandTitleWithVerificationICon(
                        title: "Mango Tree",
                        brandTextSize: TextSizes.large,
                      )
                    ],
                  )
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: TSizes.sm),
                  child: TProductPRice(
                    price: '250',
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: TColors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(TSizes.cardRadiusMd),
                        bottomRight: Radius.circular(TSizes.productImageRadius),
                      )),
                  child: const SizedBox(
                    height: TSizes.iconLg * 1.2,
                    width: TSizes.iconLg * 1.2,
                    child: Center(
                      child: Icon(
                        Iconsax.add,
                        color: TColors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TBrandTitleText extends StatelessWidget {
  const TBrandTitleText({
    super.key,
    required this.title,
    this.color,
    this.maxLines = 1,
    this.brandTextSize = TextSizes.small,
    this.textAlign = TextAlign.center,
  });
  final String title;
  final Color? color;
  final int maxLines;
  final TextSizes brandTextSize;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: brandTextSize == TextSizes.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
          : brandTextSize == TextSizes.medium
              ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
              : brandTextSize == TextSizes.large
                  ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
                  : Theme.of(context).textTheme.bodyMedium!.apply(color: color),
    );
  }
}

class TBRandTitleWithVerificationICon extends StatelessWidget {
  const TBRandTitleWithVerificationICon(
      {super.key,
      required this.title,
      this.maxLines = 1,
      this.textColor,
      this.iconColor = TColors.primary,
      this.textAlign = TextAlign.center,
      this.brandTextSize = TextSizes.small});

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: TBrandTitleText(
          title: title,
          color: textColor,
          maxLines: maxLines,
          textAlign: textAlign,
          brandTextSize: brandTextSize,
        )),
        const SizedBox(
          width: TSizes.xs,
        ),
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: TSizes.iconXs,
        )
      ],
    );
  }
}
