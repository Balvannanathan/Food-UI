import 'package:flutter_riverpod/legacy.dart';
import 'package:food_ui/Helpers/Utility/ErrorHandling.dart';
import 'package:food_ui/Pages/FavouritesScreen/FavouritesScreenModel.dart';

class FavouriteProvider extends StateNotifier<FavouriteScreenModel> {
  FavouriteProvider() : super(FavouriteScreenModel(favouriteProducts: [])) {}

  void addProduct(Map<String, dynamic> data) {
    try {
      state = state.copywith(
        favouriteProducts: [...state.favouriteProducts, data],
      );
    } on Exception catch (ex) {
      ex.logException();
    }
  }

  void removeProduct(Map<String, dynamic> data) {
    try {
      state = state.copywith(
        favouriteProducts: state.favouriteProducts
            .where((element) => element['name'] != data['name'])
            .toList(),
      );
    } on Exception catch (ex) {
      ex.logException();
    }
  }

  void clearFavourites() {
    try {
      state = state.copywith(favouriteProducts: []);
    } on Exception catch (ex) {
      ex.logException();
    }
  }
}
