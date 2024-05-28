import 'package:get/get.dart';
import 'package:mobile_design_task/src/routes/routes.dart';

class IntroController extends GetxController {
  static IntroController get instance {
    return Get.find<IntroController>();
  }

  //Navigate to Login
  login() {
    Get.toNamed(
      Routes.login,
      preventDuplicates: true,
    );
  }
}
