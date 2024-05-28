import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_design_task/src/constants/consts.dart';
import 'package:mobile_design_task/src/controllers/login_controller.dart';
import 'package:mobile_design_task/src/utils/containers/form_field_container.dart';
import 'package:mobile_design_task/src/utils/text_form_field/android_textformfield.dart';

import '../../../src/utils/buttons/my_elevated_button.dart';
import '../../../theme/colors.dart';

loginMobilePortraitScreen(colorScheme, media, controller) {
  return Scaffold(
    backgroundColor: colorScheme.surface,
    appBar: AppBar(
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.chevron_left_rounded,
          color: colorScheme.primary,
          size: 36,
          weight: 50,
        ),
      ),
    ),
    body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Login to your account",
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: defaultTextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: colorScheme.primary,
              ),
            ),
            Text(
              "Welcome back! Please enter your registered email address to continue.",
              maxLines: 4,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: defaultTextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: colorScheme.primary,
              ),
            ),
            kSizedBox,
            Form(
              key: controller.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email address",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: defaultTextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  formFieldContainer(
                    colorScheme,
                    media,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: MyTextFormField(
                      controller: controller.emailEC,
                      hintText: "Enter email",
                      focusNode: controller.emailFN,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.none,
                      onChanged: controller.emailOnChanged,
                      validator: (value) {
                        return null;
                      },
                    ),
                  ),
                  kSizedBox,
                  Text(
                    "Password",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: defaultTextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Obx(
                    () => formFieldContainer(
                      colorScheme,
                      media,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: MyTextFormField(
                        controller: controller.passwordEC,
                        hintText: "Enter password",
                        focusNode: controller.passwordFN,
                        textInputAction: TextInputAction.done,
                        textCapitalization: TextCapitalization.none,
                        obscureText: controller.passwordIsHidden.value,
                        suffix: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: GestureDetector(
                            onTap: () {
                              controller.passwordIsHidden.value =
                                  !controller.passwordIsHidden.value;
                            },
                            child: Text(
                              controller.passwordIsHidden.value
                                  ? "SHOW"
                                  : "HIDE",
                              style: defaultTextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                        onChanged: controller.passwordOnChanged,
                        onFieldSubmitted: controller.onSubmitted,
                        validator: (value) {
                          return null;
                        },
                      ),
                    ),
                  ),
                  Obx(
                    () => Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        controller.isPasswordValid.value
                            ? "Password meets the requirements"
                            : "Password must contain 8 characters,\n a number, and\n a special character.",
                        textAlign: TextAlign.end,
                        style: defaultTextStyle(
                          color: controller.isPasswordValid.value
                              ? kSuccessColor
                              : kErrorColor,
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: media.height * .36),
                  GetBuilder<LoginController>(
                    init: LoginController(),
                    builder: (controller) {
                      return MyElevatedButton(
                        title: "Continue",
                        disable: !controller.formIsValid.value,
                        isLoading: controller.isLoading.value,
                        onPressed: controller.login,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
