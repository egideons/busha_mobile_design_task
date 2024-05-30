import 'package:get/get.dart';

class XtzTransactionsController extends GetxController {
  static XtzTransactionsController get instance {
    return Get.find<XtzTransactionsController>();
  }

  var isLoading = false.obs;
}
