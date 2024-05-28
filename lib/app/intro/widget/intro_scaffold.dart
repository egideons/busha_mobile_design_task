import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../src/controllers/intro_controller.dart';
import '../../../src/utils/components/responsive_constants.dart';
import '../content/landscape_larger_screen.dart';
import '../content/mobile_portrait_screen.dart';

class IntroScaffold extends GetView<IntroController> {
  const IntroScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var introController = IntroController.instance;

    //Landscape Mode or Larger Screen
    if (deviceType(media.width) > 1) {
      return introLandscapeLargerScreen(colorScheme, media, introController);
    }

    return introMobilePortraitScreen(colorScheme, media, introController);
  }
}
