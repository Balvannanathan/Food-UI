import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_ui/Helpers/Resources/ResponsiveUI.dart';
import 'package:food_ui/Helpers/Resources/Styles.dart';
import 'package:food_ui/Pages/HomeScreen/HomeScreenModel.dart';
import 'package:food_ui/Providers/CartProvider/CartProvider.dart';
import 'package:food_ui/Providers/FavouriteProvider/FavouriteProvider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  double _opacity = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        ref
            .read(homeScreenProvider.notifier)
            .updateCurrentIndex(_tabController.index);
      }
    });

    Future.delayed(Duration.zero, () {
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
    final homeState = ref.watch(homeScreenProvider);

    return GestureDetector(
      onTap: () => primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.homeBackground,
        body: Padding(
          padding: EdgeInsets.only(top: 65.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildAppBar(),
                    SizedBox(height: 43.h),
                    SizedBox(
                      width: 210.w,
                      child: Text(
                        'Delicious food for you',
                        style: Styles.homeHeader,
                      ),
                    ),
                    SizedBox(height: 28.h),
                    _searchField(),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
              TabBar(
                controller: _tabController,
                isScrollable: true,
                labelColor: AppColors.primaryOrange,
                unselectedLabelColor: Color(0xff9A9A9D),
                indicatorColor: AppColors.primaryOrange,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 10.w),
                labelStyle: Styles.buttonText.copyWith(
                  fontSize: 17.sp,
                  color: AppColors.primaryOrange,
                ),
                dividerColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                unselectedLabelStyle: Styles.buttonText.copyWith(
                  fontSize: 17.sp,
                  color: Color(0xff9A9A9D),
                ),
                onTap: (value) {
                  ref
                      .read(homeScreenProvider.notifier)
                      .updateCurrentIndex(value);
                },
                tabs: homeState.groupedProducts.keys
                    .map((e) => Tab(text: e))
                    .toList(),
              ),

              SizedBox(height: 45.h),
              Expanded(
                child: AnimatedOpacity(
                  opacity: _opacity,
                  duration: const Duration(milliseconds: 500),
                  child: TabBarView(
                    controller: _tabController,
                    clipBehavior: Clip.none,
                    children: List.generate(
                      homeState.groupedProducts.keys.length,
                      (index) => _buildCarousel(
                        homeState.groupedProducts.values.elementAt(index),
                        homeState,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarousel(
    List<Map<String, dynamic>> products,
    HomeScreenModel homeState,
  ) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 270.h,
        viewportFraction: 0.7,
        enlargeCenterPage: true,
        initialPage: 0,
        enableInfiniteScroll: false,
        animateToClosest: true,
        clipBehavior: Clip.none,
      ),
      items: products.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.secondaryGrey.withOpacity(0.1),
                    blurRadius: 60,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    bottom: 40.h,
                    child: Column(
                      children: [
                        Container(
                          width: 180.w,
                          height: 180.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.loginBackground,
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: CircleAvatar(
                            radius: 80.r,
                            foregroundImage: AssetImage(
                              'lib/Helpers/Resources/Images/${i["image"]}',
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),

                        SizedBox(
                          width: 150.w,
                          child: Text(
                            i["name"].toString(),
                            textAlign: TextAlign.center,
                            style: Styles.productText,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Text('\$ ${i["price"]}', style: Styles.productPrice),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0.h,
                    left: 0.w,
                    child: GestureDetector(
                      onTap: () {
                        ref
                            .read(homeScreenProvider.notifier)
                            .toggleFavorite(i)
                            .then(
                              (value) => ref
                                  .read(favouriteProvider.notifier)
                                  .addAllFavourites(
                                    ref.read(homeScreenProvider).favorites,
                                  ),
                            );
                      },
                      child: Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: AppColors.primaryOrange,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.r),
                            bottomLeft: Radius.circular(20.r),
                          ),
                        ),
                        child: Icon(
                          homeState.favorites.any(
                                (element) => element['id'] == i['id'],
                              )
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: AppColors.primaryWhite,
                          size: 24.sp,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        ref
                            .read(homeScreenProvider.notifier)
                            .toggleCart(i)
                            .then(
                              (value) => ref
                                  .read(cartProvider.notifier)
                                  .addAllItems(
                                    ref.read(homeScreenProvider).cartProducts,
                                  ),
                            );
                      },
                      child: Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: AppColors.primaryOrange,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            bottomRight: Radius.circular(20.r),
                          ),
                        ),
                        child: Icon(
                          homeState.cartProducts.any(
                                (element) => element['id'] == i['id'],
                              )
                              ? Icons.done_rounded
                              : Icons.add,
                          color: AppColors.primaryWhite,
                          size: 24.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _searchField() {
    return TextField(
      cursorColor: AppColors.primaryBlack,
      cursorHeight: 18.h,
      style: Styles.fieldText.copyWith(color: AppColors.primaryBlack),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide.none,
        ),
        fillColor: AppColors.searchField,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 25.h),
        constraints: BoxConstraints(maxHeight: 60.h),
        prefixIcon: Padding(
          padding: EdgeInsetsGeometry.only(left: 10.w),
          child: Icon(Icons.search, color: AppColors.primaryBlack),
        ),
        hint: Text('Search', style: Styles.fieldText),
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          "lib/Helpers/Resources/Images/menu.png",
          width: 22.w,
          height: 14.67.h,
        ),
        GestureDetector(
          onTap: () {
            ref.read(homeScreenProvider.notifier).navigateToCartScreen();
          },
          child: Badge.count(
            count: ref.read(cartProvider).cartProducts.length,
            backgroundColor: AppColors.primaryOrange,
            isLabelVisible: ref.read(cartProvider).cartProducts.isNotEmpty,
            offset: Offset(8, -5),
            child: Image.asset(
              "lib/Helpers/Resources/Images/shop-cart.png",
              width: 24.w,
              height: 24.h,
            ),
          ),
        ),
      ],
    );
  }
}
