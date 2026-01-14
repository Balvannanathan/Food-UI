import 'package:flutter/material.dart';
import 'package:food_ui/Helpers/Resources/ResponsiveUI.dart';
import 'package:food_ui/Helpers/Resources/Styles.dart';
import 'package:food_ui/Pages/SplashScreen/SplashScreenVM.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashScreenVM vm = SplashScreenVM();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      vm.navigateToHomeScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "lib/Helpers/Resources/Images/Splash.png",
              height: 100,
              width: 100,
            ),
          ),

          SizedBox(height: 10.h),

          Text('Deliciouz', style: Styles.appTitle),
        ],
      ),
    );
  }
}
