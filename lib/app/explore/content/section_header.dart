import 'package:flutter/material.dart';

import '../../../src/constants/consts.dart';
import '../../../theme/colors.dart';

sectionHeader(
  ColorScheme colorScheme,
  String sectionTitle, {
  Function()? onTap,
}) {
  return Row(
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        sectionTitle,
        textAlign: TextAlign.start,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: defaultTextStyle(
          fontSize: 16,
          color: colorScheme.primary,
        ),
      ),
      InkWell(
        onTap: onTap ?? () {},
        borderRadius: BorderRadius.circular(10),
        child: Text(
          "See all",
          textAlign: TextAlign.end,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: defaultTextStyle(
            fontSize: 16,
            color: kAccentColor,
          ),
        ),
      ),
    ],
  );
}
