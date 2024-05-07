import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color kPrimaryColor = Color(0xFF437D28);
  static const Color kSecondryColor = Color(0xFF437D28);
  static const Color kGrayTextColor = Color(0xFF9098B1);
  static const Color kInputTextColor = Color(0x4c437c28);
}

abstract class SharedPrefKeys {
  // Login Section
  static const String kSplashIsLoggedIn = 'SlpashLoggedIn';
  // Profile Section
  static const String kProfileName = 'ProfileName';
  static const String kProfileUserName = 'ProfileUserName';
  static const String kProfileImageLink = 'ProfileImageLink';
  static const String kProfileGenderIndex = 'ProfileGenderIndex';
  static const String kProfileEmail = 'ProfileEmail';
  static const String kProfilePasswrod = 'ProfilePassword';
  static const String kProfilePhone = 'ProfilePhone';
}
