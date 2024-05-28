import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_design_task/src/constants/assets.dart';
import 'package:mobile_design_task/src/constants/consts.dart';
import 'package:mobile_design_task/src/controllers/explore_controller.dart';
import 'package:mobile_design_task/theme/colors.dart';
import 'package:readmore/readmore.dart';

import '../../../src/controllers/wallet_controller.dart';
import '../../../src/utils/components/responsive_constants.dart';
import '../content/explore_app_bar.dart';
import '../content/explore_larger_screen.dart';
import '../content/my_assets.dart';
import '../content/section_header.dart';
import '../content/top_todays_movers.dart';
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
            SizedBox(
              height: media.height * .3,
              child: ListView.separated(
                itemCount: 3,
                physics: const ScrollPhysics(),
                separatorBuilder: (context, index) => kSizedBox,
                itemBuilder: (context, index) {
                  return myAssets(
                    colorScheme,
                    assetIcon: Icons.currency_bitcoin,
                    assetColor: kBitcoinColor,
                    assetLongName: "Bitcoin",
                    assetShortName: "BTC",
                    assetAmount: "24500000",
                    assetPercentage: "1.76",
                    assetValueIncrease: true,
                  );
                },
              ),
            ),
            kSizedBox,
            Divider(color: colorScheme.inversePrimary),
            kSizedBox,
            sectionHeader(colorScheme, "Today's Top Movers", onTap: () {}),
            kSizedBox,
            SizedBox(
              height: media.height * .21,
              child: ListView.separated(
                itemCount: 3,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                separatorBuilder: (context, index) => kHalfWidthSizedBox,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return todaysTopMovers(
                    media,
                    colorScheme,
                    assetIcon: Icons.currency_bitcoin,
                    assetColor: kBitcoinColor,
                    assetLongName: "Bitcoin",
                    assetPercentage: "1.76",
                    assetValueIncrease: true,
                  );
                },
              ),
            ),
            kSizedBox,
            Divider(color: colorScheme.inversePrimary),
            kSizedBox,
            sectionHeader(colorScheme, "Trending News", onTap: () {}),
            kSizedBox,
            SizedBox(
              width: media.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: media.height * .3,
                    decoration: ShapeDecoration(
                      color: colorScheme.inversePrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      image: const DecorationImage(
                        image: AssetImage(
                          Assets.elon,
                        ),
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  kSizedBox,
                  ReadMoreText(
                    "Ethereum Co-founder opposes El-salvador Bitcoin Adoption policy",
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
                        "Coin Desk",
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
                        "2h",
                        style: defaultTextStyle(
                          color: colorScheme.inversePrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  kSizedBox,
                ],
              ),
            ),
            kSizedBox,
          ],
        ),
      ),
    );
  }
}
