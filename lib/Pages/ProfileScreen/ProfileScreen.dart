import 'package:flutter/material.dart';
import 'package:food_ui/Helpers/Resources/ResponsiveUI.dart';
import 'package:food_ui/Helpers/Resources/Styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int paymentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBackground,
      appBar: AppBar(
        title: Text(
          'Profile',
          style: Styles.homeHeader.copyWith(fontSize: 24.sp),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),

            Text(
              'Information',
              style: Styles.buttonText.copyWith(color: AppColors.primaryBlack),
            ),

            SizedBox(height: 12.h),

            _profileInfo(),

            SizedBox(height: 48.h),

            Text(
              'Payment Methods',
              style: Styles.buttonText.copyWith(color: AppColors.primaryBlack),
            ),

            SizedBox(height: 12.h),

            _paymentMethods(),
          ],
        ),
      ),
    );
  }

  Widget _profileInfo() {
    return Container(
      width: 315.w,
      height: 133.h,
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 20.w),

            Image.asset(
              'lib/Helpers/Resources/Images/profile.png',
              width: 60.w,
              height: 60.h,
            ),

            SizedBox(width: 15.w),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('John Doe', style: Styles.productText),
                SizedBox(height: 8.w),

                Text(
                  'johndoe@gmail.com',
                  style: Styles.fieldText.copyWith(fontSize: 12.sp),
                ),

                SizedBox(height: 8.h),

                SizedBox(
                  width: 191.w,
                  child: Text(
                    'No 15 uti street off ovie palace road effurun delta state',
                    softWrap: true,
                    style: Styles.fieldText.copyWith(fontSize: 12.sp),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _paymentMethods() {
    return Container(
      width: 315.w,
      padding: EdgeInsets.symmetric(vertical: 20.h),
      decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        boxShadow: [
          BoxShadow(
            blurRadius: 40.r,
            offset: Offset(0, 10),
            color: AppColors.primaryBlack.withOpacity(0.03),
          ),
        ],
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 21.w),

            Radio(
              value: index,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              groupValue: paymentIndex,
              activeColor: AppColors.primaryOrange,
              side: BorderSide(color: AppColors.ratioColor, width: 1.w),
              onChanged: (value) {
                setState(() {
                  paymentIndex = value!;
                });
              },
            ),

            SizedBox(width: 21.w),

            Container(
              width: 40.w,
              height: 40.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 11.h),
              decoration: BoxDecoration(
                color: index == 0
                    ? Color(0xffF47B0A)
                    : index == 1
                    ? Color(0xffEB4796)
                    : Color(0xff0038FF),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Image.asset(
                'lib/Helpers/Resources/Images/payment${index + 1}.png',
                width: 16.w,
                height: 16.h,
              ),
            ),
            SizedBox(width: 11.w),
            Text(
              index == 0
                  ? 'Card'
                  : index == 1
                  ? 'Bank Account'
                  : 'Paypal',
              style: Styles.paymentText,
            ),
          ],
        ),
        separatorBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
          child: Container(height: 0.3.h, color: AppColors.primaryBlack),
        ),
        itemCount: 3,
      ),
    );
  }
}
