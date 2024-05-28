import 'package:flutter/material.dart';

import '../../constants/consts.dart';

class MyListTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function()? nav;
  final double? fontSize;
  final FontWeight? fontWeight;

  const MyListTile({
    super.key,
    required this.text,
    required this.icon,
    this.nav,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      onTap: nav,
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      leading: Icon(
        icon,
        size: 24,
        color: colorScheme.surface,
      ),
      title: Text(
        text,
        style: defaultTextStyle(
          color: colorScheme.primary,
          fontSize: fontSize ?? 19,
          fontWeight: fontWeight ?? FontWeight.w700,
        ),
      ),
    );
  }
}
