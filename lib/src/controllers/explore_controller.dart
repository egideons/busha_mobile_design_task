import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_design_task/app/currency_transactions/screen/currency_transactions.dart';
import 'package:mobile_design_task/src/controllers/wallet_controller.dart';

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
  toCurrencyTransactions(String currencyName) async {
    await Get.to(
      () => CurrencyTransactions(currencyName: currencyName),
      routeName: "/currency-transactions",
      fullscreenDialog: true,
      curve: Curves.easeInOut,
      preventDuplicates: true,
      popGesture: false,
      transition: Get.defaultTransition,
    );
  }

  Future<void> handleRefresh() async {
    isLoading.value = true;
    update();
    await Future.delayed(const Duration(seconds: 3));

    isLoading.value = false;
    update();
  }

  loadBitcoinLatestBlock() async {}
  loadTezosLatestBlock() async {}
}
