import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../src/constants/assets.dart';
import '../../../src/constants/consts.dart';

firstTrendingNews(
  Size media,
  ColorScheme colorScheme, {
  double? imageHeight,
  String? firstNewsImage,
  String? firstNewsHeading,
  String? firstNewsSource,
  String? firstNewsTimeOfPublish,
}) {
  return SizedBox(
    width: media.width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: imageHeight ?? media.height * .3,
          decoration: ShapeDecoration(
            color: colorScheme.inversePrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            image: DecorationImage(
              image: AssetImage(
                firstNewsImage ?? Assets.elon,
              ),
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
            ),
          ),
        ),
        kSizedBox,
        ReadMoreText(
          firstNewsHeading ?? "",
          trimMode: TrimMode.Line,
          trimLines: 2,
          textAlign: TextAlign.start,
          style: defaultTextStyle(
            color: colorScheme.primary,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        kHalfSizedBox,
        Row(
          children: [
            Text(
              firstNewsSource ?? "",
              style: defaultTextStyle(
                color: colorScheme.inversePrimary,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            kHalfWidthSizedBox,
            Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                color: colorScheme.inversePrimary,
                shape: BoxShape.circle,
              ),
            ),
            kHalfWidthSizedBox,
            Text(
              firstNewsTimeOfPublish ?? "",
              style: defaultTextStyle(
                color: colorScheme.inversePrimary,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
