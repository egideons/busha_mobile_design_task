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
              SizedBox(
                height: media.height * .3,
                child: ListView.separated(
                  itemCount: 3,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => kHalfSizedBox,
                  itemBuilder: (context, index) {
                    return myAssets(
                      colorScheme,
                      onTap: () {
                        exploreController.toCurrencyTransactions(
                          exploreController.myAssetShortNames[index],
                        );
                      },
                      assetIcon: exploreController.myAssetIcons[index],
                      assetLongName: exploreController.myAssetLongNames[index],
                      assetShortName:
                          exploreController.myAssetShortNames[index],
                      assetValue: exploreController.myAssetValues[index],
                      assetPercentage:
                          exploreController.myAssetPercentages[index],
                      assetValueIncrease:
                          exploreController.myAssetValueIncreases[index],
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
