import 'package:blood_donor/common/appbar.dart';
import 'package:blood_donor/common/shapes/TGrid_Layout.dart';
import 'package:blood_donor/common/style/section_heading.dart';
import 'package:blood_donor/common/tabbar.dart';
import 'package:blood_donor/features/authentication/screens/shop/widget/brandshowcase.dart';
import 'package:blood_donor/features/authentication/screens/shop/widget/tcategory_tab.dart';
import 'package:blood_donor/utils/constants/colors.dart';
import 'package:blood_donor/utils/constants/sizes.dart';
import 'package:blood_donor/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: THelperFunctions.isDarkMode(context)
                      ? TColors.black
                      : TColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                      padding: const EdgeInsets.all(TSizes.defaultSpace),
                      child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            const SizedBox(
                              height: TSizes.spaceBtwItems,
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwSections,
                            ),
                            TSectionHeading(
                              title: "Featured Plants",
                              onPressed: () => Get.to(() => const ()),
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwSections / 1.5,
                            ),
                            TGridLayout(
                                mainAxisExtent: 80,
                                itemCount: 4,
                                itemBuilder: (_, index) {
                                  return const TBrandCard(showBorder: true);
                                })
                          ])),
                  bottom: const TTabBar(tabs: [
                    Tab(
                      child: Text("Tplants"),
                    ),
                    Tab(
                      child: Text("TSeeds"),
                    ),
                    Tab(
                      child: Text("TTools"),
                    ),
                    Tab(
                      child: Text("TSoil"),
                    ),
                    Tab(
                      child: Text("TAccessories"),
                    ),
                  ]))
            ];
          },
          body: const TabBarView(
            children: [
              TcategoryTab(),
              TcategoryTab(),
              TcategoryTab(),
              TcategoryTab(),
              TcategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
