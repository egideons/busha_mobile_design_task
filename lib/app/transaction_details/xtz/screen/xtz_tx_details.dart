import 'package:flutter/material.dart';
import 'package:mobile_design_task/app/transaction_details/xtz/widget/xtz_tx_details_scaffold.dart';

class XtzTxDetails extends StatelessWidget {
  const XtzTxDetails({
    super.key,
    required this.time,
    required this.hash,
    required this.bonus,
    required this.level,
    required this.txLink,
    required this.fees,
    required this.reward,
  });

  final DateTime time;
  final String hash, bonus, level, txLink, fees, reward;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: XtzTxDetailsScaffold(
        bonus: bonus,
        fees: fees,
        hash: hash,
        level: level,
        time: time,
        reward: reward,
        txLink: txLink,
      ),
    );
  }
}
