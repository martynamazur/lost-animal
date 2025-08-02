import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final BoxDecoration inputBorder = BoxDecoration(
  borderRadius:BorderRadius.circular(20),
  border: Border.all(
      color: Colors.black45,
      width: 1
  )
);

final InputDecoration frame = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(
      color: Colors.black45,
      width: 1,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(
      color: Colors.black45,
      width: 1,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(
      color: Colors.blue,
      width: 2,
    ),
  ),
);

InputDecoration customInputDecoration(ThemeData theme) {
  return InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(32),
      borderSide: BorderSide(
        color: CupertinoColors.systemGrey4,
        width: 1,
      )
    ),
    filled: true,
    fillColor: theme.colorScheme.surface,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
  );
}
