import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_design_task/app/currency_transactions/widget/currency_transactions_scaffold.dart';
import 'package:mobile_design_task/src/controllers/currency_transactions_controller.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(CurrencyTransactionsController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const CurrencyTransactionsScaffold(),
    );
  }
}
