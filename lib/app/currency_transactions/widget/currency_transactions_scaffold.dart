import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mobile_design_task/src/controllers/currency_transactions_controller.dart';
import 'package:mobile_design_task/theme/colors.dart';

import '../../../src/constants/consts.dart';

class CurrencyTransactionsScaffold
    extends GetView<CurrencyTransactionsController> {
  const CurrencyTransactionsScaffold({super.key, this.currencyName});

  final String? currencyName;

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var currencyTransactionController = CurrencyTransactionsController.instance;

    return GetBuilder<CurrencyTransactionsController>(
      init: CurrencyTransactionsController(),
      builder: (context) {
        return Scaffold(
          backgroundColor: colorScheme.surface,
          floatingActionButton:
              currencyTransactionController.isScrollToTopBtnVisible.value
                  ? FloatingActionButton.small(
                      onPressed: currencyTransactionController.scrollToTop,
                      foregroundColor: colorScheme.surface,
                      backgroundColor: colorScheme.primary,
                      child: const Icon(Iconsax.arrow_up_2),
                    )
                  : const SizedBox(),
          appBar: AppBar(
            backgroundColor: colorScheme.surface,
            leading: controller.isLoading.value
                ? const SizedBox()
                : IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.chevron_left_rounded,
                      color: colorScheme.primary,
                      size: 36,
                      weight: 50,
                    ),
                  ),
            centerTitle: true,
            title: controller.isLoading.value
                ? const SizedBox()
                : Text(
                    "$currencyName Transactions",
                    style: defaultTextStyle(
                      fontSize: 18,
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
          ),
          body: SafeArea(
            child: Scrollbar(
              controller: currencyTransactionController.scrollController,
              child: currencyTransactionController.isLoading.value
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          LoadingAnimationWidget.inkDrop(
                            color: kAccentColor,
                            size: 50,
                          ),
                          kSizedBox,
                          Text(
                            "Fetching your $currencyName Transactions",
                            textAlign: TextAlign.center,
                            style: defaultTextStyle(
                              color: colorScheme.primary,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    )
                  : ListView.separated(
                      itemCount: 30,
                      controller:
                          currencyTransactionController.scrollController,
                      padding: const EdgeInsets.all(10),
                      separatorBuilder: (context, index) => Column(
                        children: [
                          kSizedBox,
                          Divider(color: colorScheme.inversePrimary),
                          kSizedBox,
                        ],
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Container();
                      },
                    ),
            ),
          ),
        );
      },
    );
  }
}
