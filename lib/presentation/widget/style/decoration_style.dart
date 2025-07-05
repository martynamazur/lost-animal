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
