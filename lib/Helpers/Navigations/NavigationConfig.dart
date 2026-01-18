import 'package:flutter/material.dart';
import 'package:food_ui/Pages/CartScreen/CartScreen.dart';
import 'package:food_ui/Pages/HomeScreen/HomeScreen.dart';
import 'package:food_ui/Pages/LoginScreen/LoginScreen.dart';
import 'package:food_ui/Pages/OnboardingScreen/OnboardingScreen.dart';
import 'package:food_ui/Pages/RootScreen/RootScreen.dart';
import 'package:food_ui/Pages/SplashScreen/SplashScreen.dart';

/// ============================
/// 🔹 Screen Enum (Optional, for logging / analytics)
/// ============================

enum AppScreen {
  SplashScreen,
  LoginScreen,
  OnboardingScreeen,
  SignupScreen,
  RootScreen,
  ForgetPasswordScreen,
  HomeScreen,
  CartScreen,
}

/// ============================
/// 🔹 Screen Config
/// ============================

class ScreenConfig {
  final AppScreen screen;
  final Widget Function(dynamic data) builder;

  const ScreenConfig({required this.screen, required this.builder});
}

/// ============================
/// 🔹 Navigation Config
/// ============================

class NavigationConfig {
  NavigationConfig._();

  static var splashScreen = ScreenConfig(
    screen: AppScreen.SplashScreen,
    builder: (_) => SplashScreen(),
  );

  static var onboardingScreen = ScreenConfig(
    screen: AppScreen.OnboardingScreeen,
    builder: (_) => OnboardingScreen(),
  );

  static var loginScreen = ScreenConfig(
    screen: AppScreen.LoginScreen,
    builder: (_) => LoginScreen(),
  );

  // static var signup = ScreenConfig(
  //   screen: AppScreen.SignupScreen,
  //   builder: (_) => SignupScreen(),
  // );

  static var rootScreen = ScreenConfig(
    screen: AppScreen.RootScreen,
    builder: (_) => RootScreen(),
  );

  // static var forget = ScreenConfig(
  //   screen: AppScreen.ForgetPasswordScreen,
  //   builder: (_) => ForgetPasswordScreen(),
  // );

  static var homeScreen = ScreenConfig(
    screen: AppScreen.HomeScreen,
    builder: (_) => HomeScreen(),
  );

  static var cartScreen = ScreenConfig(
    screen: AppScreen.CartScreen,
    builder: (_) => CartScreen(),
  );
}
