import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_design_task/src/controllers/explore_controller.dart';

import '../content/explore_app_bar.dart';

class ExploreScaffold extends GetView<ExploreController> {
  const ExploreScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var exploreController = ExploreController.instance;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: exploreAppBar(colorScheme),
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
