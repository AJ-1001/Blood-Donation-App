import 'package:blood_donor/common/productcartvertical.dart';
import 'package:blood_donor/common/shapes/t_circular_icon.dart';
import 'package:blood_donor/common/style/product_price.dart';
import 'package:blood_donor/common/style/product_title_text.dart';
import 'package:blood_donor/utils/constants/colors.dart';
import 'package:blood_donor/utils/constants/image_strings.dart';
import 'package:blood_donor/utils/constants/sizes.dart';
import 'package:blood_donor/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.softGrey),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(
                top: TSizes.sm,
                left: TSizes.md,
              ),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(
                        title: 'Green Nike Sports Shirt',
                        smallSize: true,
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),
                      TBRandTitleWithVerificationICon(
                        title: 'Nike',
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                          child: TProductPRice(
                        price: '399.0',
                      )),
                      Container(
                        decoration: const BoxDecoration(
                            color: TColors.dark,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(TSizes.cardRadiusMd),
                                bottomRight: Radius.circular(
                                    TSizes.productImageRadius))),
                        child: const SizedBox(
                          width: TSizes.iconLg * 1.2,
                          height: TSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(
                              Iconsax.add,
                              color: TColors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
