import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_design_task/src/controllers/explore_controller.dart';

class ExploreScaffold extends GetView<ExploreController> {
  const ExploreScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var controller = ExploreController.instance;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(2),
          physics: const ScrollPhysics(),
          children: [
            Container(),
          ],
        ),
      ),
    );
  }
}
