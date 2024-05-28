import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_design_task/src/controllers/wallet_controller.dart';

import '../../../src/constants/consts.dart';
import 'explore_app_bar.dart';
import 'user_wallet_balance.dart';

exploreLargerScreen(colorScheme, media, context) {
  return Scaffold(
    appBar: exploreAppBar(colorScheme),
    backgroundColor: colorScheme.surface,
    body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(10),
        physics: const ScrollPhysics(),
        children: [
          SizedBox(
            width: media.width / 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My balance",
                  textAlign: TextAlign.start,
                  style: defaultTextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GetBuilder<WalletController>(
                  init: WalletController(),
                  builder: (controller) => IconButton(
                    onPressed: controller.changeVisibility,
                    padding: const EdgeInsets.all(0),
                    iconSize: 16,
                    icon: Icon(
                      !controller.hideBalance.value
                          ? Iconsax.eye4
                          : Iconsax.eye_slash5,
                      color: colorScheme.primary,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          userWalletBalance(colorScheme),
        ],
      ),
    ),
  );
}
