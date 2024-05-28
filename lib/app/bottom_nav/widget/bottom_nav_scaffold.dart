import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../src/controllers/bottom_nav_controller.dart';
import '../../../theme/colors.dart';

class BottomNavScaffold extends GetView<BottomNavController> {
  final int? currentIndex;
  const BottomNavScaffold({super.key, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var controller = BottomNavController.instance;

    return Scaffold(
      body: Obx(
        () => controller
            .navScreens(colorScheme)[controller.bottomNavCurrentIndex.value],
      ),
      bottomNavigationBar: Obx(
        () => CustomNavigationBar(
          currentIndex: currentIndex ?? controller.bottomNavCurrentIndex.value,
          backgroundColor: colorScheme.surface,
          selectedColor: colorScheme.primary,
          unSelectedColor: colorScheme.inversePrimary,
          strokeColor: kAccentColor,
          isFloating: false,
          items: controller.bottomNavItems(colorScheme),
          onTap: (index) => controller.bottomNavCurrentIndex.value = index,
        ),
      ),
    );
  }
}
