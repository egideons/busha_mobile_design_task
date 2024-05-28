import 'package:get/get.dart';
import 'package:mobile_design_task/src/controllers/wallet_controller.dart';

class ExploreController extends GetxController {
  static ExploreController get instance {
    return Get.find<ExploreController>();
  }

  @override
  void onInit() {
    loadWalletData();
    super.onInit();
  }

  loadWalletData() async {
    await WalletController.instance.loadVisibilityState();
  }
}
