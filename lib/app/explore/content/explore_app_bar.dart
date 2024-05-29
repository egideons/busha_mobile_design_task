import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../src/constants/consts.dart';
import '../../../theme/colors.dart';

exploreAppBar(colorScheme) {
  return AppBar(
    backgroundColor: colorScheme.surface,
    leading: IconButton(
      onPressed: () {},
      tooltip: "Scan",
      icon: Icon(
        Iconsax.scan,
        color: colorScheme.primary,
        weight: 50,
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
  );
}
