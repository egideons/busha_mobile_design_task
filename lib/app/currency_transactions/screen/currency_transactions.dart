import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_design_task/app/currency_transactions/widget/currency_transactions_scaffold.dart';
import 'package:mobile_design_task/src/controllers/currency_transactions_controller.dart';

import '../../../src/controllers/explore_controller.dart';

class CurrencyTransactions extends StatelessWidget {
  const CurrencyTransactions({super.key, this.currencyName});

  final String? currencyName;
  @override
  Widget build(BuildContext context) {
    //Initialize the controllers
    Get.put(ExploreController());
    Get.put(CurrencyTransactionsController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: CurrencyTransactionsScaffold(currencyName: currencyName),
    );
  }
}
