import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_design_task/src/constants/consts.dart';
import 'package:mobile_design_task/src/controllers/explore_controller.dart';
import 'package:mobile_design_task/src/utils/components/responsive_constants.dart';

import '../../../src/controllers/wallet_controller.dart';
import '../content/explore_app_bar.dart';

class ExploreScaffold extends GetView<ExploreController> {
  const ExploreScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;
    var exploreController = ExploreController.instance;
    var walletController = WalletController.instance;

    if (deviceType(media.width) > 1) {
      return Scaffold(
        backgroundColor: colorScheme.surface,
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(10),
            physics: const ScrollPhysics(),
            children: const [],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: exploreAppBar(colorScheme),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          physics: const ScrollPhysics(),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: media.width / 3,
                child: Row(
                  children: [
                    Text(
                      "My balance",
                      textAlign: TextAlign.start,
                      style: defaultTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
