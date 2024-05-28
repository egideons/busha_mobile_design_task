import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../src/controllers/login_controller.dart';
import '../../../src/utils/components/responsive_constants.dart';
import '../content/landscape_larger_screen.dart';
import '../content/mobile_portrait_screen.dart';

class LoginScaffold extends GetView<LoginController> {
  const LoginScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var loginController = LoginController.instance;

    //Landscape Mode or Larger Screen
    if (deviceType(media.width) > 1) {
      return loginLandscapeLargerScreen(colorScheme, media, loginController);
    }

    //Mobile or Portrait Screen
    return loginMobilePortraitScreen(colorScheme, media, loginController);
  }
}
