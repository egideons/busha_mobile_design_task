import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_design_task/app/page_nav/screen/page_nav.dart';

import '../constants/consts.dart';
import 'api_processor_controller.dart';

class LoginController extends GetxController {
  static LoginController get instance {
    return Get.find<LoginController>();
  }

  @override
  void onInit() {
    emailFN.requestFocus();
    super.onInit();
  }

  //=========== Form Key ===========\\
  final formKey = GlobalKey<FormState>();

  //=========== Controllers ===========\\
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  //=========== Focus nodes ===========\\
  final emailFN = FocusNode();
  final passwordFN = FocusNode();

  //=========== Booleans ===========\\
  var isLoading = false.obs;
  var isEmailValid = false.obs;
  var isPasswordValid = false.obs;
  var passwordIsHidden = true.obs;
  var formIsValid = false.obs;

  //=========== onChanged Functions ===========\\

  emailOnChanged(value) {
    var emailRegExp = RegExp(emailPattern);
    if (!emailRegExp.hasMatch(emailEC.text)) {
      isEmailValid.value = false;
    } else {
      isEmailValid.value = true;
    }

    update();
  }

  passwordOnChanged(value) {
    var passwordRegExp = RegExp(passwordPattern);

    if (!passwordRegExp.hasMatch(passwordEC.text)) {
      isPasswordValid.value = false;
      setFormIsInvalid();
    } else {
      isPasswordValid.value = true;
      setFormIsValid();
      update();
    }
  }

  setFormIsValid() {
    formIsValid.value = true;
  }

  setFormIsInvalid() {
    formIsValid.value = false;
  }

  //=========== Login Methods ===========\\
  onSubmitted(value) {
    if (formIsValid.isTrue) {
      login();
    }
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      if (emailEC.text.isEmpty) {
        ApiProcessorController.errorSnack("Please enter your email");
        update();
        return;
      } else if (isEmailValid.value == false) {
        ApiProcessorController.errorSnack("Please enter a valid email");
        return;
      } else if (passwordEC.text.isEmpty) {
        ApiProcessorController.errorSnack("Please enter your password");
        update();
        return;
      } else if (isPasswordValid.value == false) {
        ApiProcessorController.errorSnack("Please enter a valid password");
        return;
      }

      isLoading.value = true;
      update();

      await Future.delayed(const Duration(seconds: 3));

      ApiProcessorController.successSnack("Login successful");

      await Get.offAll(
        () => const PageNav(),
        routeName: "/bottom-nav",
        fullscreenDialog: true,
        curve: Curves.easeInOut,
        predicate: (routes) => false,
        popGesture: false,
        transition: Get.defaultTransition,
      );
    }
    isLoading.value = false;
    update();
  }
}
