import 'package:flutter/material.dart';

abstract final class AppColor {
  const AppColor();
  // static Color error = Colors.redAccent.shade100;

  static const Color primaryLight = Color(0xFFd80f0e);
  static const Color primaryDark = Color(0xFFd80f0e);

  static const Color secondaryLight = Color(0xFF000000);
  static const Color secondaryDark = Color(0xFF000000);

  static const Color grey = Colors.grey;

  static const Color greyBackground = Color(0xFFBDBDBD);

  static const Color offWhite = Color(0xFFF1F1F1);

  static const List<Color> backgroundGradient = [Colors.white, greyBackground];

  static const Color borderColor = Colors.grey;

  static const Color pendingTextColor = Color(0xFFBB780D);


  static const Color logout = Color(0xFFF5DDDD);

  // static const Color active = Color(0xFFE87282);

  // static const Color _selectedLight = secondary;
  // static const Color _selectedDark = Color(0xFF616161);

  // static Color selected(BuildContext context) =>
  //     context.isDarkMode ? _selectedDark : _selectedLight;
  // static Color grayLightDark(BuildContext context) =>
  //     context.isDarkMode ? gray : grayLight;

  // static const Color _backgroundLight = Color(0xFFFFFFFF);
  // static const Color backgroundDark = Color(0xFF373737);
  // static Color background(BuildContext context) =>
  //     context.isDarkMode ? backgroundDark : _backgroundLight;

  // static const int _activeLightInt = 0xFFFF0022;
  // static const Color activeLight = Color(_activeLightInt);
  // static const int _activeDarkInt = 0xFFC3001A;
  // static const Color activeDark = Color(_activeDarkInt);

  // static Color active(BuildContext context) =>
  //     context.isDarkMode ? activeDark : activeLight;
}
