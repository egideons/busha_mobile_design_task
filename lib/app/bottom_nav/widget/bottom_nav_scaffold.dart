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
            .bottomNav(colorScheme)[controller.bottomNavCurrentIndex.value],
      ),
      bottomNavigationBar: Obx(
        () {
          return CustomNavigationBar(
            currentIndex:
                currentIndex ?? controller.bottomNavCurrentIndex.value,
            backgroundColor: colorScheme.primary,
            selectedColor: colorScheme.surface,
            unSelectedColor: colorScheme.inversePrimary,
            strokeColor: kAccentColor,
            isFloating: true,
            borderRadius: const Radius.circular(24),
            items: controller.bottomNavItems(colorScheme),
            onTap: (index) => controller.bottomNavCurrentIndex.value = index,
          );
        },
      ),
    );
  }
}
