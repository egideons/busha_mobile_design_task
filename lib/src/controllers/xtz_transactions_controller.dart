import 'package:get/get.dart';

class XtzTransactionsController extends GetxController {
  static XtzTransactionsController get instance {
    return Get.find<XtzTransactionsController>();
  }

  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  // }

// @override
//   void onClose() {
//     // TODO: implement onClose
//     super.onClose();
//   }

  var isLoading = false.obs;
}
