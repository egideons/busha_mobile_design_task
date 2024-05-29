import 'package:flutter/material.dart';

import '../../../src/constants/consts.dart';
import '../../../theme/colors.dart';

myAssets(
  ColorScheme colorScheme, {
  Function()? onTap,
  Widget? assetIcon,
  String? assetLongName,
  String? assetShortName,
  String? assetValue,
  String? assetPercentage,
  bool? assetValueIncrease,
}) {
  return InkWell(
    onTap: onTap ?? () {},
    borderRadius: BorderRadius.circular(10),
    enableFeedback: true,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          assetIcon ??
              Container(
                padding: const EdgeInsets.all(10),
                decoration: ShapeDecoration(
                  color: kBitcoinColor,
                  shape: const CircleBorder(),
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
                            text: convertToCurrency(assetValue ?? ""),
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
                          assetValueIncrease == null ||
                                  assetValueIncrease == true
                              ? Icons.north_east_sharp
                              : Icons.south_east_sharp,
                          color: assetValueIncrease == null ||
                                  assetValueIncrease == true
                              ? kSuccessColor
                              : kErrorColor,
                          size: 16,
                        ),
                        Text(
                          "$assetPercentage%",
                          style: defaultTextStyle(
                            color: assetValueIncrease == null ||
                                    assetValueIncrease == true
                                ? kSuccessColor
                                : kErrorColor,
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
      ),
    ),
  );
}
