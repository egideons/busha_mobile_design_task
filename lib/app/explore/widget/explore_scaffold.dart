import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_design_task/src/constants/consts.dart';
import 'package:mobile_design_task/src/controllers/explore_controller.dart';
import 'package:mobile_design_task/theme/colors.dart';

import '../../../src/controllers/wallet_controller.dart';
import '../../../src/utils/components/responsive_constants.dart';
import '../content/explore_app_bar.dart';
import '../content/explore_larger_screen.dart';
import '../content/user_wallet_balance.dart';

class ExploreScaffold extends GetView<ExploreController> {
  const ExploreScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    if (deviceType(media.width) > 1) {
      return exploreLargerScreen(colorScheme, media, context);
    }

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: exploreAppBar(colorScheme),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          physics: const ScrollPhysics(),
          children: [
            SizedBox(
              width: media.width / 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "My balance",
                    textAlign: TextAlign.start,
                    style: defaultTextStyle(
                      color: colorScheme.primary,
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
            kSizedBox,
            Divider(color: colorScheme.inversePrimary),
            kSizedBox,
            sectionHeader(colorScheme, "My assets", onTap: () {}),
            kHalfSizedBox,
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: ShapeDecoration(
                    color: kBitcoinColor,
                    shape: const CircleBorder(),
                  ),
                  child: Icon(
                    Icons.currency_bitcoin,
                    color: kLightBackgroundColor,
                    weight: 50,
                    size: 32,
                  ),
                ),
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
                            "Bitcoin",
                            style: defaultTextStyle(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: nairaSign,
                              style: defaultTextStyle(
                                fontSize: 18,
                                color: colorScheme.primary,
                                fontWeight: FontWeight.w800,
                              ),
                              children: [
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
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            kSizedBox,
            Divider(color: colorScheme.inversePrimary),
            kSizedBox,
            sectionHeader(colorScheme, "Today's Top Movers", onTap: () {}),
            kSizedBox,
            Divider(color: colorScheme.inversePrimary),
            kSizedBox,
            sectionHeader(colorScheme, "Trending News", onTap: () {}),
          ],
        ),
      ),
    );
  }

  sectionHeader(
    ColorScheme colorScheme,
    String sectionTitle, {
    Function()? onTap,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          sectionTitle,
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: defaultTextStyle(
            fontSize: 16,
            color: colorScheme.primary,
          ),
        ),
        InkWell(
          onTap: onTap ?? () {},
          borderRadius: BorderRadius.circular(10),
          child: Text(
            "See all",
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: defaultTextStyle(
              fontSize: 16,
              color: kAccentColor,
            ),
          ),
        ),
      ],
    );
  }
}
