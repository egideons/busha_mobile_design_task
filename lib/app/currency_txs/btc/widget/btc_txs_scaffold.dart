import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_design_task/app/transaction_details/btc/screen/btc_transaction_details.dart';
import 'package:mobile_design_task/src/controllers/btc_txs_controller.dart';

import '../../../../src/constants/consts.dart';
import '../../widgets/tx_block.dart';
import '../../widgets/txs_loader.dart';

class BtcTxsScaffold extends GetView<BtcTxsController> {
  const BtcTxsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return GetBuilder<BtcTxsController>(
      init: BtcTxsController(),
      builder: (controller) {
        if (controller.isLoading.value) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: colorScheme.surface,
              leading: IconButton(
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
            ),
            body: SafeArea(
              child: Center(
                child: txsLoader(colorScheme, currencyName: "BTC"),
              ),
            ),
          );
        }
        return Scaffold(
          backgroundColor: colorScheme.surface,
          floatingActionButton: controller.isScrollToTopBtnVisible.value
              ? FloatingActionButton.small(
                  onPressed: controller.scrollToTop,
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
                    "BTC Transactions",
                    style: defaultTextStyle(
                      fontSize: 18,
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
          ),
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: controller.loadTransactions,
              child: Scrollbar(
                controller: controller.scrollController,
                child: GetBuilder<BtcTxsController>(
                  builder: (controller) {
                    return ListView.separated(
                      itemCount: 20,
                      controller: controller.scrollController,
                      padding: const EdgeInsets.all(10),
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) => Column(
                        children: [
                          Divider(color: colorScheme.inversePrimary),
                        ],
                      ),
                      itemBuilder: (context, index) {
                        return txBlock(
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
                          time: formatUNIXTime(1717014684),
                        );
                      },
                    );
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
