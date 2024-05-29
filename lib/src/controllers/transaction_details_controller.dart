import 'package:get/get.dart';

class TransactionDetailsController extends GetxController {
  static TransactionDetailsController get instance {
    return Get.find<TransactionDetailsController>();
  }

  var isLoading = false.obs;
}
