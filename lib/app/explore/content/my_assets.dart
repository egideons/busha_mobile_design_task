import 'package:flutter/material.dart';

import '../../../src/constants/consts.dart';
import '../../../theme/colors.dart';

myAssets(
  ColorScheme colorScheme, {
  IconData? assetIcon,
  String? assetLongName,
  String? assetShortName,
  String? assetAmount,
  String? assetPercentage,
  Color? assetColor,
  bool? assetValueIncrease,
}) {
  return Row(
    mainAxisSize: MainAxisSize.max,
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
      kWidthSizedBox,
      Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
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
                RichText(
                  text: TextSpan(
                    text: nairaSign,
                    style: defaultTextStyle(
                      fontSize: 16,
                      color: colorScheme.primary,
                      fontWeight: FontWeight.normal,
                    ),
                    children: [
                      TextSpan(
                        text: convertToCurrency(assetAmount ?? ""),
                        style: defaultTextStyle(
                          fontSize: 16,
                          color: colorScheme.primary,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  assetShortName ?? "",
                  style: defaultTextStyle(
                    color: colorScheme.inversePrimary,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
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
            )
          ],
        ),
      ),
    ],
  );
}
