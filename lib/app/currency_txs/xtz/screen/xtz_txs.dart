import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_design_task/app/currency_txs/xtz/widget/xtz_txs_scaffold.dart';
import 'package:mobile_design_task/src/controllers/xtz_txs_controller.dart';

class XtzTxs extends StatelessWidget {
  const XtzTxs({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controllers
    Get.put(XtzTxsController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const XtzTxsScaffold(),
    );
  }
}
