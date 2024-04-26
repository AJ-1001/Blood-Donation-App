import 'package:blood_donor/common/productcartvertical.dart';
import 'package:blood_donor/common/shapes/TGrid_Layout.dart';
import 'package:blood_donor/common/style/section_heading.dart';
import 'package:blood_donor/features/authentication/screens/shop/widget/brandshowcase.dart';
import 'package:blood_donor/utils/constants/image_strings.dart';
import 'package:blood_donor/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TcategoryTab extends StatelessWidget {
  const TcategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TBrandShowCase(
                images: [
                  TImages.productImage1,
                  TImages.productImage2,
                  TImages.productImage3,
                  TImages.productImage4
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TSectionHeading(
                title: 'You Might Like',
                onPressed: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TGridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) => const TProductCartVertical()),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
