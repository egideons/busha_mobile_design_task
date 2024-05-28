// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../src/controllers/auth_controller.dart';
import '../widgets/startup_splash_android_scaffold.dart';

class StartupSplashscreen extends StatelessWidget {
  const StartupSplashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize controller
    Get.put(AuthController());

    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) {
        return const StartupSplashScaffold();
      },
    );
  }
}
