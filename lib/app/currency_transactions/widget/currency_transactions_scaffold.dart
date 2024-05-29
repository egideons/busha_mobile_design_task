import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_design_task/src/controllers/currency_transactions_controller.dart';

import '../../../src/utils/components/responsive_constants.dart';

class CurrencyTransactionsScaffold
    extends GetView<CurrencyTransactionsController> {
  const CurrencyTransactionsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var currencyTransactionController = CurrencyTransactionsController.instance;

    if (deviceType(media.width) > 1) {
      return Scaffold(
        backgroundColor: colorScheme.surface,
      );
    }

    return Scaffold(
      backgroundColor: colorScheme.surface,
    );
  }
}
