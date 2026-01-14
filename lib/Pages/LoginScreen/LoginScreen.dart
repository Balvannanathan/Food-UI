import 'package:flutter/material.dart';
import 'package:food_ui/Helpers/Resources/ResponsiveUI.dart';
import 'package:food_ui/Helpers/Resources/Styles.dart';
import 'package:food_ui/Pages/LoginScreen/LoginScreenVM.dart';
import 'package:food_ui/Pages/ReusableViews/CustomButton/CustomButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  Offset _scale = Offset(0, -1);

  double _opacity = 0;
  late TabController _tabController;

  final LoginScreenVM loginScreenVM = LoginScreenVM();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    Future.delayed(Duration.zero, () {
      setState(() {
        _scale = Offset.zero;
      });
    });

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.loginBackground,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _titleContainer(),

            Expanded(
              child: AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(milliseconds: 500),
                child: TabBarView(
                  controller: _tabController,
                  children: [_loginContent(), _signupContent()],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _titleContainer() {
    return AnimatedSlide(
      offset: _scale,
      duration: const Duration(milliseconds: 500),
      child: Container(
        width: 414.w,
        height: 382.h,
        decoration: BoxDecoration(
          color: AppColors.primaryWhite,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.r),
            bottomRight: Radius.circular(30.r),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 30,
              spreadRadius: 0,
              offset: Offset(0, 4),
              color: AppColors.primaryBlack.withOpacity(0.06),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 125.h),
          child: Column(
            children: [
              Image.asset(
                'lib/Helpers/Resources/Images/Splash.png',
                width: 150.w,
                height: 162.38.h,
              ),
              Spacer(),
              AnimatedBuilder(
                animation: _tabController,
                builder: (context, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildTabItem(title: 'Login', index: 0),
                      _buildTabItem(title: 'Sign-up', index: 1),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem({required String title, required int index}) {
    final bool isActive = _tabController.index == index;
    return GestureDetector(
      onTap: () {
        _tabController.animateTo(index);
      },
      child: Container(
        width: 134.w,
        height: 45.h,
        decoration: BoxDecoration(
          border: isActive
              ? BoxBorder.fromLTRB(
                  bottom: BorderSide(
                    width: 3.w,
                    color: AppColors.primaryOrange,
                  ),
                )
              : null,
        ),
        child: Center(
          child: Text(
            title,
            style: Styles.buttonText.copyWith(
              color: AppColors.primaryBlack,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField(label: 'Email address'),
          SizedBox(height: 40.h),
          _buildTextField(label: 'Password', obscureText: true),
          SizedBox(height: 34.h),
          Text(
            'Forgot password?',
            style: Styles.buttonText.copyWith(
              color: AppColors.primaryOrange,
              fontSize: 17.sp,
            ),
          ),
          SizedBox(height: 136.h),

          CustomButton(
            width: 314.w,
            height: 70.h,
            color: AppColors.primaryOrange,
            text: 'Login',
            onTap: () => loginScreenVM.navigateToHomeScreen(),
            textColor: AppColors.primaryWhite,
          ),
        ],
      ),
    );
  }

  Widget _signupContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField(label: 'Email address'),
          SizedBox(height: 40.h),
          _buildTextField(label: 'Password', obscureText: true),
          SizedBox(height: 40.h),
          _buildTextField(label: 'Confirm Password', obscureText: true),

          SizedBox(height: 95.h),

          CustomButton(
            width: 314.w,
            height: 70.h,
            color: AppColors.primaryOrange,
            text: 'Sign-up',
            onTap: () => loginScreenVM.navigateToHomeScreen(),
            textColor: AppColors.primaryWhite,
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({required String label, bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Styles.fieldText),
        TextFormField(
          obscureText: obscureText,
          obscuringCharacter: '*',
          style: Styles.buttonText.copyWith(color: AppColors.primaryBlack),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 5.h),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryOrange),
            ),
          ),
        ),
      ],
    );
  }
}
