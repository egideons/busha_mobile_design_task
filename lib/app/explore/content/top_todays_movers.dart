import 'package:flutter/material.dart';

import '../../../src/constants/consts.dart';
import '../../../theme/colors.dart';

todaysTopMovers(
  Size? media,
  ColorScheme colorScheme, {
  IconData? assetIcon,
  String? assetLongName,
  String? assetPercentage,
  Color? assetColor,
  bool? assetValueIncrease,
}) {
  return Container(
    width: media!.width * .4,
    padding: const EdgeInsets.all(10),
    decoration: ShapeDecoration(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: colorScheme.inversePrimary),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: ShapeDecoration(
            color: assetColor ?? kBitcoinColor,
            shape: const CircleBorder(),
          ),
          child: Icon(
            assetIcon ?? Icons.currency_bitcoin,
            color: kLightBackgroundColor,
            weight: 50,
            size: 32,
          ),
        ),
        kHalfSizedBox,
        Text(
          assetLongName ?? "",
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: defaultTextStyle(
            color: colorScheme.primary,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        kHalfSizedBox,
        Row(
          children: [
            Icon(
              assetValueIncrease == null || assetValueIncrease == true
                  ? Icons.north_east_sharp
                  : Icons.south_east_sharp,
              color: kSuccessColor,
              size: 16,
            ),
            Text(
              "$assetPercentage%",
              style: defaultTextStyle(
                color: kSuccessColor,
              ),
            )
          ],
        ),
      ],
    ),
  );
}
