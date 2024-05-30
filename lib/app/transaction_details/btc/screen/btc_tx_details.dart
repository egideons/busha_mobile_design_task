import 'package:flutter/material.dart';
import 'package:mobile_design_task/app/transaction_details/btc/widget/btc_tx_details_scaffold.dart';

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
