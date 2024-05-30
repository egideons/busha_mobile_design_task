import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loadmore_listview/loadmore_listview.dart';

import '../../../../src/constants/consts.dart';
import '../../../../src/controllers/xtz_txs_controller.dart';
import '../../../../theme/colors.dart';
import '../../widgets/tx_block.dart';
import '../../widgets/txs_loader.dart';

class XtzTxsScaffold extends GetView<XtzTxsController> {
  const XtzTxsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return GetBuilder<XtzTxsController>(
      init: XtzTxsController(),
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
                child: txsLoader(colorScheme, currencyName: "XTZ"),
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
                    "XTZ Transactions",
                    style: defaultTextStyle(
                      fontSize: 18,
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
          ),
          body: SafeArea(
            child: Scrollbar(
              controller: controller.scrollController,
              child: LoadMoreListView.separated(
                itemCount: controller.displayedXtzTxs.length +
                    (controller.hasMoreData.value ? 1 : 0),
                refreshColor: kAccentColor,
                refreshBackgroundColor: colorScheme.surface,
                controller: controller.scrollController,
                hasMoreItem: controller.hasMoreData.value,
                onLoadMore: controller.loadMore,
                onRefresh: controller.loadTransactions,
                loadMoreWidget: Container(
                  margin: const EdgeInsets.all(20.0),
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(kAccentColor),
                  ),
                ),
                separatorBuilder: (context, index) => Column(
                  children: [
                    Divider(color: colorScheme.inversePrimary),
                  ],
                ),
                itemBuilder: (context, index) {
                  return txBlock(
                    colorScheme,
                    hash: controller.xtzTxsItems[index].hash,
                    time: formatDateAndTime(
                        controller.xtzTxsItems[index].timestamp),
                    toTransactionDetail: () {
                      // Get.to(
                      //   () => BtcTxDetails(
                      //     time: controller.xtzTxsItems[index].time,
                      //     hash: controller.xtzTxsItems[index].hash,
                      //     size: controller.xtzTxsItems[index].size.toString(),
                      //     blockIndex: controller.xtzTxsItems[index].blockIndex
                      //         .toString(),
                      //     height: controller.xtzTxsItems[index].blockHeight
                      //         .toString(),
                      //     txLink: controller.txLink.value,
                      //   ),
                      //   fullscreenDialog: true,
                      //   curve: Curves.easeIn,
                      //   routeName: "/btc-tx-details",
                      //   preventDuplicates: true,
                      //   popGesture: true,
                      //   transition: Get.defaultTransition,
                      // );
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
