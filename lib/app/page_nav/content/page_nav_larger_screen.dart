import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_design_task/src/utils/components/drawer_list_tile.dart';

import '../../../src/constants/consts.dart';
import '../../../theme/colors.dart';

pageNavLargerScreen(colorScheme, media, context) {
  return Scaffold(
    drawer: Drawer(
      backgroundColor: colorScheme.surface,
      width: media.width / 4,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          kHalfSizedBox,
          Container(
            decoration: BoxDecoration(
              color: colorScheme.surface,
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  Get.close(0);
                },
                padding: const EdgeInsets.all(10),
                icon: Icon(
                  Iconsax.close_circle5,
                  weight: 50,
                  color: colorScheme.primary,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              children: [
                drawerListTile(
                  context,
                  text: "Explore",
                  textColor: kTextWhiteColor,
                  icon: Iconsax.discover5,
                  iconColor: kLightBackgroundColor,
                  selected: true,
                  selectedTileColor: kAccentColor,
                  tileShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  nav: () {
                    Get.close(0);
                  },
                ),
                kSizedBox,
                drawerListTile(
                  context,
                  text: "Portfolio",
                  icon: Iconsax.wallet_2,
                  tileShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  nav: () {},
                ),
                kSizedBox,
                drawerListTile(
                  context,
                  text: "Earn",
                  icon: Iconsax.percentage_circle,
                  tileShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  nav: () {},
                ),
                kSizedBox,
                drawerListTile(
                  context,
                  text: "Spend",
                  icon: Iconsax.receipt,
                  tileShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  nav: () {},
                ),
                kSizedBox,
                drawerListTile(
                  context,
                  text: "Connect",
                  icon: Iconsax.link,
                  tileShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  nav: () {},
                ),
                kSizedBox,
              ],
            ),
          ),
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
                Iconsax.menu5,
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
