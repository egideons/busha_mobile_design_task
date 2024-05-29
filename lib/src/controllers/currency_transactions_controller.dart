import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_design_task/src/routes/routes.dart';

class CurrencyTransactionsController extends GetxController {
  static CurrencyTransactionsController get instance {
    return Get.find<CurrencyTransactionsController>();
  }

  @override
  void onInit() async {
    await loadTransactions();
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

  //================ Variables =================\\
  var isLoading = false.obs;

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

//================ Load transactions =================//
  Future<void> loadTransactions() async {
    isLoading.value = true;
    update();

    await Future.delayed(const Duration(seconds: 3));

    isLoading.value = false;
    update();
  }

//================ Navigation =================//
  toTransactionDetails() {
    Get.toNamed(Routes.transactionDetails, preventDuplicates: true);
  }
}
