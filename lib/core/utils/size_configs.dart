import 'package:flutter/material.dart';

// Responsive Design

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenW; // screen width
  static double? screenH; // screen height
  static double? blockH; // block horizontal
  static double? blockV; // block vertical

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenW = _mediaQueryData!.size.width;
    screenH = _mediaQueryData!.size.height;
    blockH = screenW! / 100;
    blockV = screenH! / 100;
  }
}
