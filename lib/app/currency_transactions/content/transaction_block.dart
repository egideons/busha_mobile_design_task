import 'package:flutter/material.dart';
import 'package:mobile_design_task/src/constants/consts.dart';

transactionBlock(
  ColorScheme colorScheme, {
  Function()? toTransactionDetail,
  String? hash,
  String? time,
}) {
  return ListTile(
    onTap: toTransactionDetail,
    enableFeedback: true,
    title: Text(
      hash ?? "",
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.start,
      style: defaultTextStyle(
        color: colorScheme.primary,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    subtitle: Text(
      time ?? "",
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.start,
      style: defaultTextStyle(
        color: colorScheme.inversePrimary,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
    trailing: Icon(
      Icons.chevron_right_rounded,
      color: colorScheme.inversePrimary,
      weight: 50,
      size: 32,
    ),
  );
}
