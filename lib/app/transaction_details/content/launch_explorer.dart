import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../src/constants/consts.dart';

launchExplorer(ColorScheme colorScheme, {Function()? launch}) {
  return InkWell(
    onTap: launch ?? () {},
    borderRadius: BorderRadius.circular(12),
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            Iconsax.export_2,
            color: colorScheme.primary,
          ),
          Text(
            "View on blockchain explorer",
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            style: defaultTextStyle(
              fontSize: 16,
              color: colorScheme.primary,
            ),
          ),
          Icon(
            Icons.chevron_right_rounded,
            color: colorScheme.inversePrimary,
          ),
        ],
      ),
    ),
  );
}
