import 'package:flutter/material.dart';
import 'package:food_ui/Helpers/Resources/ResponsiveUI.dart';

class AppColors {
  static const Color primaryWhite = Color(0xffFFFFFF);
  static const Color primaryBlack = Color(0xff000000);
  static const Color primaryOrange = Color(0xffFA4A0C);
  static const Color splashBackground = Color(0xffFF4B3A);

  static const Color loginBackground = Color(0xffEDEDED);
  static const Color homeBackground = Color(0xffF2F2F2);
  static const Color searchField = Color(0xffEFEEEE);
  static const Color secondaryGrey = Color(0xff393939);

  static Color bottomNavShadow = Color(0xffD73800).withOpacity(0.4);
}

class Styles {
  Styles._();

  /// Base builder
  static TextStyle _base({
    required String fontFamily,
    required double fontSize,
    FontWeight? fontWeight,
    double? height,
    required Color color,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      height: height,
      color: color,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle get appTitle => _base(
    fontFamily: "ROUNDED-HEAVY",
    fontSize: 34,
    color: AppColors.primaryOrange,
  );

  static TextStyle get appHeaderText => _base(
    fontFamily: "ROUNDED-HEAVY",
    fontSize: 65,
    height: 1,
    color: AppColors.primaryWhite,
  );

  static TextStyle get homeHeader => _base(
    fontFamily: "ROUNDED-BOLD",
    fontSize: 34,
    color: AppColors.primaryBlack,
  );

  static TextStyle get buttonText => _base(
    fontFamily: "SEMIBOLD",
    fontSize: 17,
    color: AppColors.primaryWhite,
  );

  static TextStyle get productText => _base(
    fontFamily: "SEMIBOLD",
    fontSize: 22,
    color: AppColors.primaryBlack,
  );

  static TextStyle get productPrice => _base(
    fontFamily: "ROUNDED-BOLD",
    fontSize: 17,
    color: AppColors.primaryOrange,
  );

  static TextStyle get fieldText => _base(
    fontFamily: "SEMIBOLD",
    fontSize: 15,
    color: AppColors.primaryBlack.withOpacity(0.4),
  );
}
