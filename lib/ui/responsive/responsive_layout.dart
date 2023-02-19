import 'package:flutter/material.dart';
import 'package:townsquare/ui/values/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    required this.mobile,
    required this.web,
    Key? key,
  }) : super(key: key);

  final Widget mobile;
  final Widget web;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < desktopWidth) {
        return mobile;
      } else {
        return web;
      }
    });
  }
}
