import 'package:flutter/material.dart';
import 'package:food_ui/Helpers/Resources/ResponsiveUI.dart';
import 'package:food_ui/Helpers/Resources/Styles.dart';
import 'package:food_ui/Pages/OnboardingScreen/DependentViews/SlideAnimation.dart';
import 'package:food_ui/Pages/OnboardingScreen/OnboardingScreenVM.dart';
import 'package:food_ui/Pages/ReusableViews/CustomButton/CustomButton.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final OnboardingScreenVM _vm = OnboardingScreenVM();
  double _scale = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(milliseconds: 1000), () {
      if (!mounted) return;
      setState(() {
        _scale = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackground,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 49.w),
            child: SlideAnimation(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  SizedBox(height: 56.h),

                  _logo(),
                  SizedBox(height: 31.h),

                  _title(),
                  SizedBox(height: 50.h),
                ],
              ),
            ),
          ),

          Stack(
            alignment: AlignmentGeometry.bottomCenter,
            children: [
              SlideAnimation(
                child: Image.asset(
                  "lib/Helpers/Resources/Images/background.png",
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                bottom: 25.h,
                child: AnimatedScale(
                  scale: _scale,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                  child: CustomButton(
                    width: 314.w,
                    height: 70.h,
                    text: "Get Started",
                    color: AppColors.primaryWhite,
                    textColor: AppColors.primaryOrange,
                    onTap: () {
                      setState(() {
                        _scale = 0;
                      });
                      
                      _vm.navigateToLoginScreen();
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _logo() {
    return Container(
      width: 73.w,
      height: 73.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primaryWhite,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 10.h,
          bottom: 10.h,
          left: 17.w,
          right: 15.w,
        ),
        child: Image.asset("lib/Helpers/Resources/Images/logo.png"),
      ),
    );
  }

  Widget _title() {
    return Text(
      "Food for Everyone",
      style: Styles.appHeaderText.copyWith(letterSpacing: -3),
    );
  }
}
