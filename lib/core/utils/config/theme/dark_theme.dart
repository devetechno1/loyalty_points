import 'package:flutter/material.dart';

import '../../constants/app_color.dart';

ThemeData get darkTheme => ThemeData(
      primaryColor: AppColor.primaryDark,
      brightness: Brightness.dark,
      cardColor: Colors.grey.shade800,
      textTheme:const TextTheme(
        labelLarge: TextStyle(fontSize: 19),
      ),
      colorScheme: const ColorScheme.dark(
        primary: AppColor.primaryDark,
        secondary: AppColor.secondaryDark,
      ),
    );
