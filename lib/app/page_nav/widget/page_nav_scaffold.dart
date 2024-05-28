import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_design_task/src/utils/components/drawer_list_tile.dart';
import 'package:mobile_design_task/src/utils/components/responsive_constants.dart';

import '../../../src/constants/consts.dart';
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
        drawer: Drawer(
          backgroundColor: colorScheme.surface,
          width: media.width / 4,
          child: ListView(
            padding: const EdgeInsets.all(2),
            children: [
              MyListTile(text: "text", icon: icon),
            ],
          ),
        ),
        appBar: AppBar(
          leadingWidth: media.width * .12,
          leading: Builder(
            builder: (context) => Wrap(
              children: [
                IconButton(
                  tooltip: "Drawer",
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(
                    Iconsax.menu,
                    color: colorScheme.primary,
                    weight: 50,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  tooltip: "Scan",
                  icon: Icon(
                    Iconsax.scan,
                    color: colorScheme.primary,
                    weight: 50,
                  ),
                ),
              ],
            ),
          ),
          centerTitle: true,
          title: Text(
            "Explore",
            style: defaultTextStyle(
              fontSize: 18,
              color: colorScheme.primary,
              fontWeight: FontWeight.w800,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              tooltip: "Search",
              icon: Icon(
                Iconsax.search_normal,
                color: colorScheme.primary,
                size: 24,
                weight: 50,
              ),
            ),
            IconButton(
              onPressed: () {},
              tooltip: "Notifications",
              padding: const EdgeInsets.all(0),
              alignment: Alignment.center,
              icon: Stack(
                children: [
                  Icon(
                    Iconsax.notification,
                    color: colorScheme.primary,
                    weight: 50,
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: ShapeDecoration(
                        color: kErrorColor,
                        shape: const CircleBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(10),
            physics: const ScrollPhysics(),
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: media.width / 3,
                  child: Row(
                    children: [
                      Text(
                        "My balance",
                        textAlign: TextAlign.start,
                        style: defaultTextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
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
