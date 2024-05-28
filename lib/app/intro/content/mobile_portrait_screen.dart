import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../src/constants/assets.dart';
import '../../../src/constants/consts.dart';
import '../../../src/utils/buttons/my_elevated_button.dart';

introMobilePortraitScreen(colorScheme, media, controller) {
  return Scaffold(
    appBar: AppBar(toolbarHeight: 0),
    backgroundColor: colorScheme.surface,
    body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Lottie.asset(
              Assets.introAnim,
            ),
            const SizedBox(height: kDefaultPadding * 4),
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
  );
}
