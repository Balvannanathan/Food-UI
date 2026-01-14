import 'package:flutter_riverpod/legacy.dart';
import 'package:food_ui/Pages/FavouritesScreen/FavouritesScreenModel.dart';
import 'package:food_ui/Pages/FavouritesScreen/FavouritesScreenVM.dart'
    show FavouriteProvider;

var favouriteProvider =
    StateNotifierProvider<FavouriteProvider, FavouriteScreenModel>(
      (ref) => FavouriteProvider(),
    );