import 'package:flutter/material.dart';
import 'package:food_ui/Helpers/Resources/ResponsiveUI.dart';
import 'package:food_ui/Helpers/Resources/Styles.dart';
import 'package:food_ui/Pages/FavouritesScreen/FavouritesScreen.dart';
import 'package:food_ui/Pages/HomeScreen/HomeScreen.dart';
import 'package:food_ui/Pages/OrderHistory/OrderHistoryScreen.dart';
import 'package:food_ui/Pages/ProfileScreen/ProfileScreen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int currentIndex = 0;

  List icons = [
    Icons.home_rounded,
    Icons.favorite_border_outlined,
    Icons.person_rounded,
    Icons.history_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      child: Scaffold(
        backgroundColor: AppColors.homeBackground,
        body: IndexedStack(
          index: currentIndex,
          children: [
            HomeScreen(),
            FavouritesScreen(),
            ProfileScreen(),
            OrderHistoryScreen(),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 103.h,
          child: Theme(
            data: ThemeData(splashFactory: NoSplash.splashFactory),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              backgroundColor: AppColors.homeBackground,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              items: List.generate(
                4,
                (index) => BottomNavigationBarItem(
                  activeIcon: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.bottomNavShadow,
                          blurRadius: 30.r,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Icon(
                      index == 1 ? Icons.favorite : icons[index],
                      size: 30.sp,
                      color: AppColors.primaryOrange,
                    ),
                  ),

                  label: '',
                  icon: Icon(icons[index], size: 30.sp),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
