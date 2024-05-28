import 'package:flutter/material.dart';

import '../../constants/consts.dart';

drawerListTile(
  context, {
  text,
  textColor,
  icon,
  iconColor,
  nav,
  fontSize,
  fontWeight,
  selected,
  selectedColor,
  selectedTileColor,
  ShapeBorder? tileShape,
  hoverColor,
  focusColor,
}) {
  var colorScheme = Theme.of(context).colorScheme;
  return ListTile(
    onTap: nav,
    enableFeedback: true,
    mouseCursor: SystemMouseCursors.click,
    selected: selected ?? false,
    selectedColor: selectedColor,
    selectedTileColor: selectedTileColor,
    hoverColor: hoverColor,
    focusColor: focusColor,
    style: ListTileStyle.drawer,
    shape: tileShape,
    leading: Icon(
      icon,
      color: iconColor ?? colorScheme.primary,
      weight: 50,
    ),
    title: Text(
      text,
      style: defaultTextStyle(
        color: textColor ?? colorScheme.primary,
        fontSize: fontSize ?? 19,
        fontWeight: fontWeight ?? FontWeight.w700,
      ),
    ),
  );
}
