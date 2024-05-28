// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_design_task/src/controllers/intro_controller.dart';

import '../widget/intro_scaffold.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialise controller
    Get.put(IntroController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const IntroScaffold(),
    );
  }
}
