import 'package:blood_donor/utils/constants/colors.dart';
import 'package:blood_donor/utils/device/device_utility.dart';
import 'package:blood_donor/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({super.key, required this.tabs});

  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Material(
        color: dark ? TColors.black : TColors.white,
        child: TabBar(
          tabs: tabs,
          isScrollable: true,
          labelColor: dark ? TColors.white : TColors.primary,
          unselectedLabelColor: TColors.darkerGrey,
          indicatorColor: TColors.primary,
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
