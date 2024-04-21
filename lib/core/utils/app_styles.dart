import 'package:climb_up/core/utils/constants.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle interStyleRegular12(BuildContext context) {
    return TextStyle(
      color: AppColors.kGrayTextColor,
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }
  static TextStyle interStyleBold12(BuildContext context) {
    return TextStyle(
      color: Colors.black,
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    );
  }
   static TextStyle poppinsStyleMedium12(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle poppinsStyleRegular12(BuildContext context) {
    return TextStyle(
      color: AppColors.kPrimaryColor,
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
  }
  static TextStyle poppinsStyleRegular14(BuildContext context) {
    return TextStyle(
      color: AppColors.kInputTextColor,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
  }
static TextStyle poppinsStyleSemiBold14(BuildContext context) {
    return TextStyle(
      color: AppColors.kSecondryColor,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle poppinsStyleBold14(BuildContext context) {
    return TextStyle(
      color: AppColors.kPrimaryColor,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    );
  }

static TextStyle poppinsStyleSemiBold16(BuildContext context) {
    return TextStyle(
      color: AppColors.kPrimaryColor,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle poppinsStyleMedium16(BuildContext context) {
    return TextStyle(
      color: AppColors.kPrimaryColor,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle poppinsStyleBold24(BuildContext context) {
    return TextStyle(
      color: AppColors.kPrimaryColor,
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    );
  }
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .7;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  if (width < 600) {
    return width / 400;
  } else if (width < 1200) {
    return width / 750;
  } else {
    return width / 1920;
  }
}
