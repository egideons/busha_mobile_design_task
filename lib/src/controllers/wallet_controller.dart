import 'dart:developer';

import 'package:get/get.dart';

import '../../main.dart';

class WalletController extends GetxController {
  static WalletController get instance {
    return Get.find<WalletController>();
  }

  var isLoading = false.obs;
  var hideBalance = false.obs;

  changeVisibility() {
    hideBalance.value = !hideBalance.value;
    log("Balance Hidden: ${hideBalance.value}");
    saveVisibilityState(hideBalance.value);
    update();
  }

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
