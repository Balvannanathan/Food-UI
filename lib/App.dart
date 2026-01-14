import 'package:flutter/material.dart';
import 'package:food_ui/Helpers/AppConstants/AppConstants.dart';
import 'package:food_ui/Helpers/Navigations/NavigationConfig.dart';
import 'package:food_ui/Helpers/Navigations/NavigationHelper.dart';
import 'package:food_ui/Helpers/Resources/ResponsiveUI.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ResponsiveUI(
      context,
      figmaHeight: Appconstants.baseHeight,
      figmaWidth: Appconstants.baseWidth,
    );

    return MaterialApp(
      title: 'Food UI',
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationHelper.navigatorKey,
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) => NavigationConfig.splashScreen.builder(null),
      ),
    );
  }
}
// 