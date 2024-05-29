import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../src/constants/assets.dart';
import '../../../src/constants/consts.dart';

trendingNews(
  Size media,
  ColorScheme colorScheme, {
  Function()? onTap,
  String? firstNewsImage,
  String? firstNewsHeading,
  String? firstNewsSource,
  String? firstNewsTimeOfPublish,
}) {
  return InkWell(
    onTap: onTap ?? () {},
    borderRadius: BorderRadius.circular(10),
    enableFeedback: true,
    child: SizedBox(
      width: media.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: media.width / 3.6,
            height: media.height * .2,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              image: const DecorationImage(
                image: AssetImage(Assets.elon),
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              ),
            ),
          ),
          kHalfWidthSizedBox,
          Expanded(
            child: Column(
              children: [
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
          ),
        ],
      ),
    ),
  );
}
