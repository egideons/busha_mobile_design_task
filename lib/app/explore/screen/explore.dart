import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../src/controllers/explore_controller.dart';
import '../widget/explore_scaffold.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controllers
    Get.put(ExploreController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const ExploreScaffold(),
    );
  }
}
