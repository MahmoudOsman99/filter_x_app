import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'input_decoration_settings.dart';
import 'text_settings.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  // scaffoldBackgroundColor: Colors.transparent,
  textTheme: textSettings,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  ),
  inputDecorationTheme: inputDecorationTheme,
);
