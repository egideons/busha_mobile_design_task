import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_design_task/app/explore/screen/explore.dart';
import 'package:mobile_design_task/src/utils/components/responsive_constants.dart';

import '../../../src/controllers/page_nav_controller.dart';
import '../../../theme/colors.dart';

class PageNavScaffold extends GetView<PageNavController> {
  final int? currentIndex;
  const PageNavScaffold({super.key, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;
    var controller = PageNavController.instance;

    if (deviceType(media.width) > 1) {
      return Scaffold(
        appBar: AppBar(),
        body: const Explore(),
      );
    }

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
