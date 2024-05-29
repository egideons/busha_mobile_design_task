import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_design_task/src/controllers/explore_controller.dart';

import '../../../src/utils/components/responsive_constants.dart';
import '../content/explore_larger_screen.dart';
import '../content/explore_mobile_screen.dart';

class ExploreScaffold extends GetView<ExploreController> {
  const ExploreScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var exploreController = ExploreController.instance;

    if (deviceType(media.width) > 1) {
      return exploreLargerScreen(colorScheme, exploreController, media);
    }

    return exploreMobileScreen(colorScheme, exploreController, media);
  }
}
