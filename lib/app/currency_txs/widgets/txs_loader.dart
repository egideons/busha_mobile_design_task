import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../src/constants/consts.dart';
import '../../../theme/colors.dart';

txsLoader(ColorScheme colorScheme, {String? currencyName}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LoadingAnimationWidget.inkDrop(
          color: kAccentColor,
          size: 50,
        ),
        kSizedBox,
        Text(
          "Fetching your $currencyName Transactions",
          textAlign: TextAlign.center,
          style: defaultTextStyle(
            color: colorScheme.primary,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    ),
  );
}
