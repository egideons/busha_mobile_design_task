import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_design_task/src/controllers/url_launch_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../src/constants/consts.dart';
import '../../widgets/launch_explorer.dart';
import '../../widgets/tx_info_section.dart';

class XtzTxDetailsScaffold extends StatelessWidget {
  const XtzTxDetailsScaffold({
    super.key,
    this.time,
    this.hash,
    this.reward,
    this.level,
    this.bonus,
    this.txLink,
    this.fees,
  });

  final DateTime? time;
  final String? hash, level, reward, bonus, txLink, fees;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

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
                txInfoSection(
                  colorScheme,
                  media,
                  left: "Hash",
                  right: hash,
                ),
                kSizedBox,
                Divider(color: colorScheme.inversePrimary),
                kSizedBox,
                txInfoSection(
                  colorScheme,
                  media,
                  left: "Time",
                  right: formatDateAndTime(time ?? DateTime.now()),
                ),
                kSizedBox,
                Divider(color: colorScheme.inversePrimary),
                kSizedBox,
                txInfoSection(
                  colorScheme,
                  media,
                  left: "Level",
                  right: level ?? "",
                ),
                kSizedBox,
                Divider(color: colorScheme.inversePrimary),
                kSizedBox,
                txInfoSection(
                  colorScheme,
                  media,
                  left: "Reward",
                  right: reward ?? "",
                ),
                kSizedBox,
                Divider(color: colorScheme.inversePrimary),
                kSizedBox,
                txInfoSection(
                  colorScheme,
                  media,
                  left: "Bonus",
                  right: bonus ?? "",
                ),
                kSizedBox,
                Divider(color: colorScheme.inversePrimary),
                kSizedBox,
                txInfoSection(
                  colorScheme,
                  media,
                  left: "Fees",
                  right: fees ?? "",
                ),
                kSizedBox,
                Divider(color: colorScheme.inversePrimary),
                kSizedBox,
              ],
            ),
            const SizedBox(height: kDefaultPadding * 2),
            txLaunchExplorer(
              colorScheme,
              launch: () {
                UrlLaunchController.launchWebView(
                  Uri.parse(txLink ?? "https://google.com"),
                  LaunchMode.externalApplication,
                );
              },
            ),
            const SizedBox(height: kDefaultPadding * 4),
          ],
        ),
      ),
    );
  }
}
