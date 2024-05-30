import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_design_task/app/transaction_details/btc/widget/btc_tx_details_scaffold.dart';
import 'package:mobile_design_task/src/controllers/btc_transaction_details_controller.dart';

class BtcTxDetails extends StatelessWidget {
  const BtcTxDetails({
    super.key,
    required this.time,
    required this.hash,
    required this.size,
    required this.blockIndex,
    required this.height,
    required this.txLink,
  });

  final int time;
  final String hash, size, blockIndex, height, txLink;

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(BTCTransactionDetailsController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: BtcTxDetailsScaffold(
        blockIndex: blockIndex,
        hash: hash,
        height: height,
        size: size,
        time: time,
        txLink: txLink,
      ),
    );
  }
}
