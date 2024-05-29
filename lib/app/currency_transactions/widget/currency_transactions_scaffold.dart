import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mobile_design_task/src/controllers/currency_transactions_controller.dart';

import '../../../src/constants/consts.dart';
import '../../../src/utils/components/responsive_constants.dart';

class CurrencyTransactionsScaffold
    extends GetView<CurrencyTransactionsController> {
  const CurrencyTransactionsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var currencyTransactionController = CurrencyTransactionsController.instance;

    if (deviceType(media.width) > 1) {
      return Scaffold(
        backgroundColor: colorScheme.surface,
      );
    }

    return Scaffold(
      backgroundColor: colorScheme.surface,
      floatingActionButton: Obx(
        () => currencyTransactionController.isScrollToTopBtnVisible.value
            ? FloatingActionButton.small(
                onPressed: currencyTransactionController.scrollToTop,
                foregroundColor: colorScheme.surface,
                backgroundColor: colorScheme.primary,
                child: const Icon(Iconsax.arrow_up_2),
              )
            : const SizedBox(),
      ),
      appBar: AppBar(
        leading: Obx(
          () => controller.isLoading.value
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
        ),
      ),
      body: GetBuilder<CurrencyTransactionsController>(
        init: CurrencyTransactionsController(),
        builder: (context) {
          return currencyTransactionController.isLoading.value
              ? LoadingAnimationWidget.inkDrop(
                  color: colorScheme.primary,
                  size: 50,
                )
              : ListView.separated(
                  itemCount: 6,
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
                );
        },
      ),
    );
  }
}
