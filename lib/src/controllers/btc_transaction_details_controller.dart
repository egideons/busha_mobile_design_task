import 'package:get/get.dart';

class BTCTransactionDetailsController extends GetxController {
  static BTCTransactionDetailsController get instance {
    return Get.find<BTCTransactionDetailsController>();
  }

  var isLoading = false.obs;
}
