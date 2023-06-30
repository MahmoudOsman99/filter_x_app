import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

extension SizeInfo on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
}

extension ThemeMode on BuildContext {
  bool get isDarkMode =>
      MediaQuery.of(this).platformBrightness == Brightness.dark;
}

extension TextStyles on BuildContext {
  TextTheme get textList => Theme.of(this).textTheme;
}
