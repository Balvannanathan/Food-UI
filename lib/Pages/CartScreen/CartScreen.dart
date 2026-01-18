import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_ui/Helpers/Resources/ResponsiveUI.dart';
import 'package:food_ui/Helpers/Resources/Styles.dart';
import 'package:food_ui/Providers/CartProvider/CartProvider.dart';
import 'package:food_ui/Providers/FavouriteProvider/FavouriteProvider.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  List<Map<String, dynamic>> get _cartItems =>
      ref.watch(cartProvider).cartProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBackground,
      appBar: AppBar(
        title: Text('Cart', style: Styles.homeHeader.copyWith(fontSize: 24.sp)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 40.w),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryBlack,
              size: 20.sp,
            ),
            onPressed: () {
              ref.read(cartProvider.notifier).navigateToHomeScreen();
            },
          ),
        ),
      ),
      body: _cartItems.isEmpty
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
                  Text("No items added yet", style: Styles.fieldText),
                ],
              ),
            )
          : ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
              itemCount: _cartItems.length,
              separatorBuilder: (context, index) => SizedBox(height: 20.h),
              itemBuilder: (context, index) {
                final item = _cartItems[index];
                return Slidable(
                  closeOnScroll: true,
                  endActionPane: ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      SizedBox(
                        width: 150.w,
                        height: 102.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(width: 10.w),

                            GestureDetector(
                              onTap: () {
                                ref
                                    .read(favouriteProvider.notifier)
                                    .addProduct(item);

                                ref
                                    .read(cartProvider.notifier)
                                    .addFavouriteProduct(item);
                              },
                              child: Container(
                                width: 55.w,
                                height: 55.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primaryOrange,
                                ),
                                child: Icon(
                                  ref
                                          .watch(favouriteProvider)
                                          .favouriteProducts
                                          .contains(item)
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: Colors.white,
                                  size: 30.sp,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            GestureDetector(
                              onTap: () {
                                ref
                                    .read(cartProvider.notifier)
                                    .removeProduct(item);
                                ref
                                    .read(homeScreenProvider.notifier)
                                    .removeCartProduct(item);
                              },
                              child: Container(
                                width: 55.w,
                                height: 55.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primaryOrange,
                                ),
                                child: Icon(
                                  Icons.delete_outline,
                                  color: Colors.white,
                                  size: 30.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  child: _productCard(item),
                );
              },
            ),
    );
  }

  Widget _productCard(Map<String, dynamic> item) {
    return Container(
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
                  style: Styles.productText.copyWith(fontSize: 17.sp),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5.h),
                Text(
                  '\$${item['price']}',
                  style: Styles.productPrice.copyWith(fontSize: 15.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
