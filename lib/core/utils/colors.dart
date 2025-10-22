
import 'package:flutter/material.dart';

class AppColors{
  static final Color primaryColor = Color(0xFFFF0000);
  static final Color darkColor = Color(0xFF1C191C);
  static final Color secondDarkColor = Color(0xFF232323);
  static final Color lightColor = Color(0xFFf2f4f5);
  static final Color succesColor = Color(0xFF25b763);
  static final Color errorColor = Color(0xFFdb2955);
  static final Color errorColorBg = Color(0xFF2E2829);
  static final Color greyColor = Color(0xFF979797);

  static LinearGradient backgroundGradient = LinearGradient(
    colors: [lightColor, darkColor],
    begin: Alignment.topRight,
    end: Alignment.bottomCenter,
  );
}