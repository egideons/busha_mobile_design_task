import 'package:flutter/material.dart';

import '../../../src/constants/consts.dart';

txInfoSection(
  ColorScheme colorScheme,
  Size media, {
  String? left,
  String? right,
}) {
  return Row(
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        left ?? "",
        textAlign: TextAlign.start,
        overflow: TextOverflow.ellipsis,
        style: defaultTextStyle(
          fontSize: 16,
          color: colorScheme.primary,
        ),
      ),
      kWidthSizedBox,
      SizedBox(
        width: media.width / 1.8,
        child: Text(
          right ?? "",
          maxLines: 12,
          textAlign: TextAlign.end,
          overflow: TextOverflow.ellipsis,
          style: defaultTextStyle(
            fontSize: 16,
            color: colorScheme.primary,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ],
  );
}
