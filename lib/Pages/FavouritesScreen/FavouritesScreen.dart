import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_ui/Helpers/Resources/ResponsiveUI.dart';
import 'package:food_ui/Helpers/Resources/Styles.dart';
import 'package:food_ui/Providers/FavouriteProvider/favouriteProvider.dart';

class FavouritesScreen extends ConsumerStatefulWidget {
  const FavouritesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FavouritesScreenState();
}

class _FavouritesScreenState extends ConsumerState<FavouritesScreen> {
  List<Map<String, dynamic>> get _favorites =>
      ref.watch(favouriteProvider).favouriteProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBackground,
      appBar: AppBar(
        title: Text(
          'Favorites',
          style: Styles.homeHeader.copyWith(fontSize: 24.sp),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //     color: AppColors.primaryBlack,
        //     size: 20.sp,
        //   ),
        //   onPressed: () {
        //     // Check if we can pop, otherwise maybe switch tab or do nothing
        //     if (Navigator.canPop(context)) {
        //       Navigator.pop(context);
        //     }
        //   },
        // ),
      ),
      body: _favorites.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 100.sp,
                    color: Colors.grey.shade300,
                  ),
                  SizedBox(height: 20.h),
                  Text("No favorites yet", style: Styles.fieldText),
                ],
              ),
            )
          : ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
              itemCount: _favorites.length,
              separatorBuilder: (context, index) => SizedBox(height: 20.h),
              itemBuilder: (context, index) {
                final item = _favorites[index];
                return Dismissible(
                  key: Key(item['name']),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 30.w),
                    decoration: BoxDecoration(
                      color: AppColors.primaryOrange,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Icon(
                      Icons.delete_outline,
                      color: Colors.white,
                      size: 30.sp,
                    ),
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      ref.read(favouriteProvider.notifier).removeProduct(item);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("${item['name']} removed from favorites"),
                        duration: Duration(milliseconds: 600),
                      ),
                    );
                  },
                  child: Container(
                    height: 102.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.secondaryGrey.withOpacity(0.05),
                          offset: Offset(0, 10),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 15.w),
                        CircleAvatar(
                          radius: 35.r,
                          backgroundColor: AppColors.loginBackground,
                          backgroundImage: AssetImage(
                            'lib/Helpers/Resources/Images/${item["image"]}',
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: Styles.productText.copyWith(
                                  fontSize: 17.sp,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                'N${item['price']}',
                                style: Styles.productPrice.copyWith(
                                  fontSize: 15.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
