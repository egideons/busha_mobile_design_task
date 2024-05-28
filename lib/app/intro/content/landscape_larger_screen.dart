import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../src/constants/assets.dart';
import '../../../src/constants/consts.dart';
import '../../../src/utils/buttons/my_elevated_button.dart';

introLandscapeLargerScreen(colorScheme, media, controller) {
  return Scaffold(
    appBar: AppBar(toolbarHeight: 0),
    backgroundColor: colorScheme.surface,
    body: SafeArea(
      child: Row(
        children: [
          SizedBox(
            width: media.width / 2.1,
            child: Lottie.asset(
              Assets.introAnim,
              width: media.width,
            ),
          ),
          Container(
            width: media.width / 2.4,
            margin: const EdgeInsets.only(left: 12, right: 12),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: defaultTextStyle(
                      color: colorScheme.primary,
                      fontSize: 34,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  kSizedBox,
                  MyElevatedButton(
                    title: "Continue",
                    onPressed: controller.login,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
