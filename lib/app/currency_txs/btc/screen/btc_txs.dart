import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_design_task/app/currency_txs/btc/widget/btc_txs_scaffold.dart';
import 'package:mobile_design_task/src/controllers/btc_txs_controller.dart';

class BtcTxs extends StatelessWidget {
  const BtcTxs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //Initialize the controllers
    // Get.put(ExploreController());
    Get.put(BtcTxsController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const BtcTxsScaffold(),
    );
  }
}
