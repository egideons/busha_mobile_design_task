import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_design_task/src/utils/components/responsive_constants.dart';

import '../../../src/controllers/bottom_nav_controller.dart';
import '../../../theme/colors.dart';

class BottomNavScaffold extends GetView<BottomNavController> {
  final int? currentIndex;
  const BottomNavScaffold({super.key, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;
    var controller = BottomNavController.instance;

    if (deviceType(media.width) > 1) {
      return Scaffold(
        body: Row(
          children: [
            Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    title: const Text('Item 1'),
                    onTap: () {
                      // Do something
                    },
                  ),
                  ListTile(
                    title: const Text('Item 2'),
                    onTap: () {
                      // Do something
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: Obx(
        () => controller
            .bottomNav(colorScheme)[controller.bottomNavCurrentIndex.value],
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
