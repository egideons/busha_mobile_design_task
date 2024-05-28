import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_design_task/src/constants/consts.dart';

import '../../../src/controllers/wallet_controller.dart';

userWalletBalance(colorScheme) {
  return GetBuilder<WalletController>(
    init: WalletController(),
    builder: (controller) => RichText(
      text: TextSpan(
        text: nairaSign,
        style: defaultTextStyle(
          fontSize: 18,
          color: colorScheme.primary,
          fontWeight: FontWeight.w800,
        ),
        children: controller.hideBalance.value
            ? [
                TextSpan(
                  text: convertToCurrency(
                    "5000".replaceAll(RegExp(hideDigits), "*"),
                  ),
                  style: defaultTextStyle(
                    fontSize: 32,
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                TextSpan(
                  text: convertToCurrency(
                    ".00".replaceAll(RegExp(hideDigits), "*"),
                  ),
                  style: defaultTextStyle(
                    fontSize: 18,
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ]
            : [
                TextSpan(
                  text: convertToCurrency("5000"),
                  style: defaultTextStyle(
                    fontSize: 32,
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                TextSpan(
                  text: convertToCurrency(".00"),
                  style: defaultTextStyle(
                    fontSize: 18,
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
      ),
    ),
  );
}
