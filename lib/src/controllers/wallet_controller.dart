import 'package:get/get.dart';

import '../../main.dart';

class WalletController extends GetxController {
  static WalletController get instance {
    return Get.find<WalletController>();
  }

  @override
  void onInit() {
    WalletController.instance.loadVisibilityState();
    super.onInit();
  }

  var isLoading = false.obs;
  var hideBalance = false.obs;

  //=========================== Save card state ============================//
  // Load visibility state from SharedPreferences
  Future<void> loadVisibilityState() async {
    hideBalance.value = prefs.getBool('hideBalance') ?? hideBalance.value;
    update();
  }

  // Save visibility state to SharedPreferences
  Future<void> saveVisibilityState(bool value) async {
    await prefs.setBool('hideBalance', value);
  }
}
