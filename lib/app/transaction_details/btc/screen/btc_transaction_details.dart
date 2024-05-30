import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_design_task/app/transaction_details/btc/widget/btc_transaction_details_scaffold.dart';
import 'package:mobile_design_task/src/controllers/btc_transaction_details_controller.dart';

class BTCTransactionDetails extends StatelessWidget {
  const BTCTransactionDetails({super.key, this.currencyName});

  final String? currencyName;
  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(BTCTransactionDetailsController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const BTCTransactionDetailsScaffold(),
    );
  }
}
