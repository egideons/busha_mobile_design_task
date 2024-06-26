// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../../theme/colors.dart';
import '../../constants/consts.dart';

class MyOutlinedButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final bool isLoading;
  final bool disable;
  final String? fontFamily;
  final double? buttonElevation, fontSize;
  final bool? isRowVisible, isSwitched;
  final IconData? buttonIcon;
  final Color? buttonIconColor, borderColor;
  final double? buttonIconSize;

  const MyOutlinedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.disable = false,
    this.fontSize,
    this.fontFamily,
    this.buttonElevation,
    this.isRowVisible,
    this.buttonIcon,
    this.buttonIconColor,
    this.buttonIconSize,
    this.isSwitched = false,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;
    return OutlinedButton(
      onPressed: disable
          ? null
          : isLoading
              ? null
              : onPressed,
      onLongPress: null,
      style: OutlinedButton.styleFrom(
        disabledBackgroundColor: colorScheme.primary.withOpacity(0.2),
        backgroundColor: colorScheme.surface,
        side: BorderSide(color: borderColor ?? colorScheme.primary),
        elevation: buttonElevation ?? 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minimumSize: Size(media.width, 60),
      ),
      child: isLoading
          ? CircularProgressIndicator(color: kAccentColor)
          : isRowVisible == true
              ? isSwitched == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          buttonIcon,
                          color: buttonIconColor,
                          size: buttonIconSize ?? 16,
                        ),
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: defaultTextStyle(
                            color: colorScheme.inversePrimary,
                            fontSize: fontSize ?? 18,
                            fontFamily: fontFamily,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.40,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: defaultTextStyle(
                            color: colorScheme.inversePrimary,
                            fontSize: fontSize ?? 18,
                            fontFamily: fontFamily,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.40,
                          ),
                        ),
                        Icon(
                          buttonIcon,
                          color: buttonIconColor,
                          size: buttonIconSize ?? 16,
                        ),
                      ],
                    )
              : Text(
                  title,
                  textAlign: TextAlign.center,
                  style: defaultTextStyle(
                    color: colorScheme.inversePrimary,
                    fontSize: fontSize ?? 16,
                    fontFamily: fontFamily,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.40,
                  ),
                ),
    );
  }
}
