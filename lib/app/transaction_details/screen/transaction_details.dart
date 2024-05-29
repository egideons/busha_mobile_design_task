import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_design_task/app/transaction_details/widget/transaction_details_scaffold.dart';
import 'package:mobile_design_task/src/controllers/transaction_details_controller.dart';

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({super.key, this.currencyName});

  final String? currencyName;
  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(TransactionDetailsController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const TransactionDetailsScaffold(),
    );
  }
}
