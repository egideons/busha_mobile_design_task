import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../../app/intro/screen/intro.dart';

class AuthController extends GetxController {
  static AuthController get instance {
    return Get.find<AuthController>();
  }

  @override
  void onInit() {
    Timer(const Duration(seconds: 2), () {
      loadApp();
    });
    super.onInit();
  }

  Future<void> loadApp() async {
    await Get.offAll(
      () => const Intro(),
      routeName: "/intro",
      fullscreenDialog: true,
      curve: Curves.easeInOut,
      predicate: (routes) => false,
      popGesture: false,
      transition: Get.defaultTransition,
    );
  }
}
