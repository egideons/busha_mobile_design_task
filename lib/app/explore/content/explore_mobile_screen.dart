import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_design_task/src/constants/assets.dart';
import 'package:mobile_design_task/src/constants/consts.dart';
import 'package:mobile_design_task/src/controllers/explore_controller.dart';

import '../../../src/controllers/wallet_controller.dart';
import '../content/explore_app_bar.dart';
import '../content/first_trending_news.dart';
import '../content/my_assets.dart';
import '../content/section_header.dart';
import '../content/top_todays_movers.dart';
import '../content/trending_news.dart';
import '../content/user_wallet_balance.dart';

exploreMobileScreen(
  ColorScheme colorScheme,
  ExploreController exploreController,
  Size media,
) {
  return Scaffold(
    backgroundColor: colorScheme.surface,
    appBar: exploreAppBar(colorScheme),
    floatingActionButton: Obx(
      () => exploreController.isScrollToTopBtnVisible.value
          ? FloatingActionButton.small(
              onPressed: exploreController.scrollToTop,
              foregroundColor: colorScheme.surface,
              backgroundColor: colorScheme.primary,
              child: const Icon(Iconsax.arrow_up_2),
            )
          : const SizedBox(),
    ),
    body: SafeArea(
      child: Scrollbar(
        controller: exploreController.scrollController,
        child: RefreshIndicator(
          onRefresh: exploreController.handleRefresh,
          child: ListView(
            controller: exploreController.scrollController,
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
              Column(
                children: [
                  myAssets(
                    colorScheme,
                    onTap: () {
                      exploreController.toCurrencyTransactions("BTC");
                    },
                    assetIcon: Image.asset(
                      Assets.btcIcon,
                      fit: BoxFit.contain,
                      height: 46,
                      width: 46,
                    ),
                    assetLongName: "Bitcoin",
                    assetShortName: "BTC",
                    assetValue: "24500000",
                    assetPercentage: "1.76",
                    assetValueIncrease: true,
                  ),
                  myAssets(
                    colorScheme,
                    onTap: () {},
                    assetIcon: Image.asset(
                      Assets.ethIcon,
                      fit: BoxFit.contain,
                      height: 46,
                      width: 46,
                    ),
                    assetLongName: "Ethereum",
                    assetShortName: "ETH",
                    assetValue: "4500",
                    assetPercentage: "6.76",
                    assetValueIncrease: false,
                  ),
                  myAssets(
                    colorScheme,
                    onTap: () {
                      exploreController.toCurrencyTransactions("XTZ");
                    },
                    assetIcon: Image.asset(
                      Assets.xtzIcon,
                      fit: BoxFit.contain,
                      height: 46,
                      width: 46,
                    ),
                    assetLongName: "Tezos",
                    assetShortName: "xtz",
                    assetValue: "4500",
                    assetPercentage: "9.06",
                    assetValueIncrease: true,
                  ),
                ],
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
                      assetIcon: exploreController.todaysMoversIcon[index],
                      assetLongName:
                          exploreController.todaysMoversLongNames[index],
                      assetPercentage:
                          exploreController.todaysMoversPercentages[index],
                      assetValueIncrease:
                          exploreController.todaysMoversValueIncreases[index],
                    );
                  },
                ),
              ),
              kSizedBox,
              Divider(color: colorScheme.inversePrimary),
              kSizedBox,
              sectionHeader(colorScheme, "Trending News", onTap: () {}),
              kSizedBox,
              firstTrendingNews(
                media,
                colorScheme,
                firstNewsImage: Assets.elon,
                firstNewsHeading:
                    "Ethereum Co-founder opposes El-salvador Bitcoin Adoption policy",
                firstNewsSource: "Coin Desk",
                firstNewsTimeOfPublish: "2h",
              ),
              kSizedBox,
              Divider(color: colorScheme.inversePrimary),
              kSizedBox,
              ListView.separated(
                itemCount: 6,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => Column(
                  children: [
                    kSizedBox,
                    Divider(color: colorScheme.inversePrimary),
                    kSizedBox,
                  ],
                ),
                itemBuilder: (context, index) {
                  return trendingNews(
                    media,
                    colorScheme,
                    firstNewsImage: Assets.elon,
                    firstNewsHeading:
                        "Ethereum Co-founder opposes El-salvador Bitcoin Adoption policy",
                    firstNewsSource: "Coin Desk",
                    firstNewsTimeOfPublish: "2h",
                  );
                },
              ),
              kSizedBox,
            ],
          ),
        ),
      ),
    ),
  );
}
