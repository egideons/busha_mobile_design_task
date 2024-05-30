import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_design_task/app/currency_transactions/btc/widget/btc_txs_scaffold.dart';
import 'package:mobile_design_task/src/controllers/btc_txs_controller.dart';

import '../../../../src/controllers/explore_controller.dart';

class BtcTxs extends StatelessWidget {
  const BtcTxs({super.key, this.currencyName});

  final String? currencyName;
  @override
  Widget build(BuildContext context) {
    //Initialize the controllers
    Get.put(ExploreController());
    Get.put(BtcTxsController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: BtcTxsScaffold(currencyName: currencyName),
    );
  }
}
