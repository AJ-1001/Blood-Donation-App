import 'package:blood_donor/common/productcartvertical.dart';
import 'package:blood_donor/common/shapes/TGrid_Layout.dart';
import 'package:blood_donor/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      DropdownButtonFormField(
        decoration: const InputDecoration(
          prefixIcon: Icon(Iconsax.sort),
        ),
        onChanged: (value) {},
        items: ['Name', 'Higher Price', 'Lower Price', 'Newest', 'Popularity']
            .map((Option) =>
                DropdownMenuItem(value: Option, child: Text(Option)))
            .toList(),
      ),
      const SizedBox(
        height: TSizes.spaceBtwSections,
      ),
      TGridLayout(
          itemCount: 4, itemBuilder: (_, index) => const TProductCartVertical())
    ]);
  }
}
