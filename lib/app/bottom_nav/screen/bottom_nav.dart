import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_design_task/src/controllers/bottom_nav_controller.dart';

import '../widget/bottom_nav_scaffold.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(BottomNavController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const BottomNavScaffold(),
    );
  }
}
