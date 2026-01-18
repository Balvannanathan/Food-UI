import 'package:flutter_riverpod/legacy.dart';
import 'package:food_ui/Pages/FavouritesScreen/FavouritesScreenModel.dart';
import 'package:food_ui/Pages/FavouritesScreen/FavouritesScreenVM.dart'
    show FavouriteProvider;
import 'package:food_ui/Pages/HomeScreen/HomeScreenModel.dart';
import 'package:food_ui/Pages/HomeScreen/HomeScreenVM.dart';

var favouriteProvider =
    StateNotifierProvider<FavouriteProvider, FavouriteScreenModel>(
      (ref) => FavouriteProvider(),
    );

var homeScreenProvider = StateNotifierProvider<HomeScreenVM, HomeScreenModel>(
  (ref) => HomeScreenVM(),
);