import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mobile_design_task/src/controllers/transaction_details_controller.dart';

import '../../../src/constants/consts.dart';
import '../content/tx_info_section.dart';

class TransactionDetailsScaffold extends GetView<TransactionDetailsController> {
  const TransactionDetailsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var transactionDetailsController = TransactionDetailsController.instance;

    return Scaffold(
      backgroundColor: colorScheme.surface,
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
        centerTitle: true,
        title: Text(
          "Transaction details",
          style: defaultTextStyle(
            fontSize: 18,
            color: colorScheme.primary,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          physics: const ScrollPhysics(),
          children: [
            kSizedBox,
            Column(
              children: [
                txInfoSection(colorScheme, media,
                    left: "Hash",
                    right:
                        "0000000000000000000142177b09be503dc0817ce2ff0a2736fdc5150e6829a0"),
                kSizedBox,
                Divider(color: colorScheme.inversePrimary),
                kSizedBox,
                txInfoSection(colorScheme, media,
                    left: "Time", right: "2019-08-24 • 15:43"),
                kSizedBox,
                Divider(color: colorScheme.inversePrimary),
                kSizedBox,
                txInfoSection(colorScheme, media, left: "Size", right: "9195"),
                kSizedBox,
                Divider(color: colorScheme.inversePrimary),
                kSizedBox,
                txInfoSection(colorScheme, media,
                    left: "Block Index", right: "818044"),
                kSizedBox,
                Divider(color: colorScheme.inversePrimary),
                kSizedBox,
                txInfoSection(colorScheme, media,
                    left: "Height", right: "154595"),
                kSizedBox,
                Divider(color: colorScheme.inversePrimary),
                kSizedBox,
                txInfoSection(colorScheme, media,
                    left: "Received time", right: "2019-08-24 • 15:43"),
                kSizedBox,
                Divider(color: colorScheme.inversePrimary),
                kSizedBox,
              ],
            ),
            const SizedBox(height: kDefaultPadding * 4),
            InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Iconsax.export_2,
                    color: colorScheme.primary,
                  ),
                  Text(
                    "View on blockchain explorer",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: defaultTextStyle(
                      fontSize: 16,
                      color: colorScheme.primary,
                    ),
                  ),
                  Icon(
                    Icons.chevron_right_rounded,
                    color: colorScheme.primary,
                  ),
                ],
              ),
            ),
            const SizedBox(height: kDefaultPadding * 4),
          ],
        ),
      ),
    );
  }
}
