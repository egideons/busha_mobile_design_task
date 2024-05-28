import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../app/explore/screen/explore.dart';
import '../constants/consts.dart';

class BottomNavController extends GetxController {
  static BottomNavController get instance {
    return Get.find<BottomNavController>();
  }

  var bottomNavCurrentIndex = 0.obs;

//=================== Screens =====================\\
  bottomNav(colorScheme) => [
        const Explore(),
        Container(
          color: colorScheme.surface,
          child: Center(
            child: Text(
              "Portfolio",
              style: defaultTextStyle(color: colorScheme.primary),
            ),
          ),
        ),
        Container(
          color: colorScheme.surface,
          child: Center(
            child: Text(
              "Earn",
              style: defaultTextStyle(color: colorScheme.primary),
            ),
          ),
        ),
        Container(
          color: colorScheme.surface,
          child: Center(
            child: Text(
              "Spend",
              style: defaultTextStyle(color: colorScheme.primary),
            ),
          ),
        ),
        Container(
          color: colorScheme.surface,
          child: Center(
            child: Text(
              "Connect",
              style: defaultTextStyle(color: colorScheme.primary),
            ),
          ),
        ),
      ];

  //=================== Nav Items =====================\\
  bottomNavItems(colorScheme) => [
        CustomNavigationBarItem(
          icon: const Icon(Iconsax.discover_1),
          selectedIcon: const Icon(Iconsax.discover5),
          title: Text(
            "Explore",
            style: defaultTextStyle(color: colorScheme.inversePrimary),
          ),
          selectedTitle: Text(
            "Explore",
            style: defaultTextStyle(color: colorScheme.primary),
          ),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Iconsax.wallet_2),
          selectedIcon: const Icon(Iconsax.wallet_money1),
          title: Text(
            "Portfolio",
            style: defaultTextStyle(color: colorScheme.inversePrimary),
          ),
          selectedTitle: Text(
            "Portfolio",
            style: defaultTextStyle(color: colorScheme.primary),
          ),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Iconsax.percentage_circle),
          selectedIcon: const Icon(Iconsax.percentage_circle5),
          title: Text(
            "Earn",
            style: defaultTextStyle(color: colorScheme.inversePrimary),
          ),
          selectedTitle: Text(
            "Earn",
            style: defaultTextStyle(color: colorScheme.primary),
          ),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Iconsax.receipt),
          selectedIcon: const Icon(Iconsax.receipt_15),
          title: Text(
            "Spend",
            style: defaultTextStyle(color: colorScheme.inversePrimary),
          ),
          selectedTitle: Text(
            "Spend",
            style: defaultTextStyle(color: colorScheme.primary),
          ),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Iconsax.link),
          selectedIcon: const Icon(Iconsax.link_15),
          title: Text(
            "Connect",
            style: defaultTextStyle(color: colorScheme.inversePrimary),
          ),
          selectedTitle: Text(
            "Connect",
            style: defaultTextStyle(color: colorScheme.primary),
          ),
        ),
      ];
}
