import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_design_task/src/controllers/page_nav_controller.dart';

import '../widget/page_nav_scaffold.dart';

class PageNav extends StatelessWidget {
  const PageNav({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(PageNavController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const PageNavScaffold(),
    );
  }
}
