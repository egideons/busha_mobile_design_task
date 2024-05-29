import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_design_task/src/controllers/wallet_controller.dart';

import '../../../src/constants/assets.dart';
import '../../../src/constants/consts.dart';
import '../../../src/controllers/explore_controller.dart';
import 'explore_app_bar.dart';
import 'first_trending_news.dart';
import 'my_assets.dart';
import 'section_header.dart';
import 'top_todays_movers.dart';
import 'trending_news.dart';
import 'user_wallet_balance.dart';

exploreLargerScreen(
  ColorScheme colorScheme,
  ExploreController exploreController,
  Size media,
) {
  return Scaffold(
    appBar: exploreAppBar(colorScheme),
    backgroundColor: colorScheme.surface,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        kHalfSizedBox,
                        Divider(color: colorScheme.inversePrimary),
                        kSizedBox,
                        sectionHeader(colorScheme, "My assets", onTap: () {}),
                        kHalfSizedBox,
                        SizedBox(
                          height: media.height * .56,
                          child: ListView.separated(
                            itemCount: 3,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) => kSizedBox,
                            itemBuilder: (context, index) {
                              return myAssets(
                                colorScheme,
                                onTap: () {
                                  exploreController.toCurrencyTransactions(
                                    exploreController.myAssetShortNames[index],
                                  );
                                },
                                assetIcon:
                                    exploreController.myAssetIcons[index],
                                assetLongName:
                                    exploreController.myAssetLongNames[index],
                                assetShortName:
                                    exploreController.myAssetShortNames[index],
                                assetValue:
                                    exploreController.myAssetValues[index],
                                assetPercentage:
                                    exploreController.myAssetPercentages[index],
                                assetValueIncrease: exploreController
                                    .myAssetValueIncreases[index],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  kWidthSizedBox,
                  kWidthSizedBox,
                  Expanded(
                    child: Column(
                      children: [
                        kHalfSizedBox,
                        Divider(color: colorScheme.inversePrimary),
                        kSizedBox,
                        sectionHeader(colorScheme, "Today's Top Movers",
                            onTap: () {}),
                        kHalfSizedBox,
                        SizedBox(
                          height: media.height * .44,
                          child: ListView.separated(
                            itemCount: 3,
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            separatorBuilder: (context, index) =>
                                kHalfWidthSizedBox,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return todaysTopMovers(
                                media,
                                colorScheme,
                                assetIcon:
                                    exploreController.todaysMoversIcon[index],
                                assetLongName: exploreController
                                    .todaysMoversLongNames[index],
                                assetPercentage: exploreController
                                    .todaysMoversPercentages[index],
                                assetValueIncrease: exploreController
                                    .todaysMoversValueIncreases[index],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              kSizedBox,
              Divider(color: colorScheme.inversePrimary),
              kSizedBox,
              sectionHeader(colorScheme, "Trending News", onTap: () {}),
              kSizedBox,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: firstTrendingNews(
                      media,
                      colorScheme,
                      imageHeight: media.height * .6,
                      firstNewsImage: Assets.elon,
                      firstNewsHeading:
                          "Ethereum Co-founder opposes El-salvador Bitcoin Adoption policy",
                      firstNewsSource: "Coin Desk",
                      firstNewsTimeOfPublish: "2h",
                    ),
                  ),
                  kWidthSizedBox,
                  kWidthSizedBox,
                  Expanded(
                    child: ListView.separated(
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
                  ),
                ],
              ),
              kSizedBox,
            ],
          ),
        ),
      ),
    ),
  );
}
