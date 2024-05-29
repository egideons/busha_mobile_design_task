import 'package:flutter/material.dart';

import '../../../src/constants/consts.dart';
import '../../../theme/colors.dart';

todaysTopMovers(
  Size? media,
  ColorScheme colorScheme, {
  Function()? onTap,
  Widget? assetIcon,
  String? assetLongName,
  String? assetPercentage,
  bool? assetValueIncrease,
}) {
  return InkWell(
    onTap: onTap ?? () {},
    borderRadius: BorderRadius.circular(10),
    enableFeedback: true,
    child: Container(
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
          assetIcon ??
              Container(
                padding: const EdgeInsets.all(10),
                decoration: ShapeDecoration(
                  color: kBitcoinColor,
                  shape: const CircleBorder(),
                ),
              ),
          kWidthSizedBox,
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
                color: assetValueIncrease == null || assetValueIncrease == true
                    ? kSuccessColor
                    : kErrorColor,
                size: 16,
              ),
              Text(
                "$assetPercentage%",
                style: defaultTextStyle(
                  color:
                      assetValueIncrease == null || assetValueIncrease == true
                          ? kSuccessColor
                          : kErrorColor,
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}
