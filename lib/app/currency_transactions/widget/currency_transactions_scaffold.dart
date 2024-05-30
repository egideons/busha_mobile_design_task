import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_design_task/app/transaction_details/btc/screen/btc_transaction_details.dart';
import 'package:mobile_design_task/src/controllers/currency_transactions_controller.dart';

import '../../../src/constants/consts.dart';
import '../content/loader.dart';
import '../content/transaction_block.dart';

class CurrencyTransactionsScaffold
    extends GetView<CurrencyTransactionsController> {
  const CurrencyTransactionsScaffold({super.key, this.currencyName});

  final String? currencyName;

  @override
  Widget build(BuildContext context) {
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
            child: RefreshIndicator(
              onRefresh: currencyTransactionController.loadTransactions,
              child: Scrollbar(
                controller: currencyTransactionController.scrollController,
                child: GetBuilder<CurrencyTransactionsController>(
                  builder: (context) {
                    if (currencyTransactionController.isLoading.value) {
                      return loader(colorScheme, currencyName: currencyName);
                    } else {
                      return ListView.separated(
                        itemCount: 20,
                        controller:
                            currencyTransactionController.scrollController,
                        padding: const EdgeInsets.all(10),
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        separatorBuilder: (context, index) => Column(
                          children: [
                            Divider(color: colorScheme.inversePrimary),
                          ],
                        ),
                        itemBuilder: (context, index) {
                          return transactionBlock(
                            colorScheme,
                            toTransactionDetail: () {
                              Get.to(
                                () => const BTCTransactionDetails(),
                                fullscreenDialog: true,
                                curve: Curves.easeIn,
                                routeName: "/transaction-details",
                                preventDuplicates: true,
                                popGesture: true,
                                transition: Get.defaultTransition,
                              );
                            },
                            hash:
                                "0000000000000000000142177b09be503dc0817ce2ff0a2736fdc5150e6829a0",
                            time: "2019-08-24 • 15:43",
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
