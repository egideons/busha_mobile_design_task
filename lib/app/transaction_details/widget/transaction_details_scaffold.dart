import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_design_task/src/controllers/transaction_details_controller.dart';

class TransactionDetailsScaffold extends GetView<TransactionDetailsController> {
  const TransactionDetailsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          physics: const ScrollPhysics(),
          children: [
            Container(),
          ],
        ),
      ),
    );
  }
}
