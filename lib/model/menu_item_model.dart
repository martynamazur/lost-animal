import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/material/icons.dart';

class MenuItem {
  final String label;
  final PageRouteInfo? route;
  final Icon icon;

  MenuItem({required this.label, required this.route,  required this.icon});
}
