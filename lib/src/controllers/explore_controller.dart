import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_design_task/src/controllers/wallet_controller.dart';
import 'package:mobile_design_task/src/routes/routes.dart';

import '../constants/assets.dart';

class ExploreController extends GetxController {
  static ExploreController get instance {
    return Get.find<ExploreController>();
  }

  @override
  void onInit() {
    loadWalletData();
    scrollController.addListener(scrollListener);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }

  //================ Controllers =================\\
  var scrollController = ScrollController();

  //================ Booleans =================\\
  var isScrollToTopBtnVisible = false.obs;

  //================ Variables =================//
  var isLoading = false.obs;
  //My Assets
  var myAssetIcons = <dynamic>[
    Image.asset(
      Assets.btcIcon,
      fit: BoxFit.contain,
      height: 46,
      width: 46,
    ),
    Image.asset(
      Assets.ethIcon,
      fit: BoxFit.contain,
      height: 46,
      width: 46,
    ),
    Image.asset(
      Assets.xtzIcon,
      fit: BoxFit.contain,
      height: 46,
      width: 46,
    ),
  ];

  var myAssetLongNames = <String>[
    "Bitcoin",
    "Ethereum",
    "Tezos",
  ];
  var myAssetShortNames = <String>[
    "BTC",
    "ETH",
    "XTZ",
  ];
  var myAssetValues = <String>[
    "24500000",
    "4500",
    "4500",
  ];
  var myAssetPercentages = <String>[
    "1.76",
    "6.76",
    "9.06",
  ];
  var myAssetValueIncreases = <bool>[
    true,
    false,
    true,
  ];

  //Today's Top Movers
  var todaysMoversIcon = <dynamic>[
    Image.asset(
      Assets.ethIcon,
      fit: BoxFit.contain,
      height: 46,
      width: 46,
    ),
    Image.asset(
      Assets.btcIcon,
      fit: BoxFit.contain,
      height: 46,
      width: 46,
    ),
    Image.asset(
      Assets.solIcon,
      fit: BoxFit.contain,
      height: 46,
      width: 46,
    ),
  ];

  var todaysMoversLongNames = <String>[
    "Ethereum",
    "Bitcoin",
    "Solana",
  ];

  var todaysMoversPercentages = <String>[
    "6.76",
    "1.76",
    "1.76",
  ];
  var todaysMoversValueIncreases = <bool>[
    false,
    true,
    true,
  ];

  //================ Scroll to Top =================//
  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }

//================ Scroll Listener =================//

  void scrollListener() {
    //========= Show action button ========//
    if (scrollController.position.pixels >= 150) {
      isScrollToTopBtnVisible.value = true;
      update();
    }
    //========= Hide action button ========//
    else if (scrollController.position.pixels < 150) {
      isScrollToTopBtnVisible.value = false;
      update();
    }
  }

  //Load Wallet Data
  loadWalletData() async {
    await WalletController.instance.loadVisibilityState();
  }

  //Navigate to currency transactions
  toCurrencyTransactions() {
    Get.toNamed(Routes.currencyTransactions, preventDuplicates: true);
  }

  Future<void> handleRefresh() async {
    isLoading.value = true;
    update();
    await Future.delayed(const Duration(seconds: 3));

    isLoading.value = false;
    update();
  }
}
