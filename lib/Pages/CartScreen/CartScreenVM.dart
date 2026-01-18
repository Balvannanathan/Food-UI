import 'package:flutter_riverpod/legacy.dart';
import 'package:food_ui/Helpers/Navigations/NavigationMixin.dart';
import 'package:food_ui/Helpers/Utility/ErrorHandling.dart';
import 'package:food_ui/Pages/CartScreen/CartScreenModel.dart';

class CartProvider extends StateNotifier<CartScreenModel> with NavigationMixin {
  CartProvider()
    : super(CartScreenModel(cartProducts: [], favouriteProducts: [])) {}

  void addProduct(Map<String, dynamic> data) {
    try {
      state = state.copywith(cartProducts: [...state.cartProducts, data]);
    } on Exception catch (ex) {
      ex.logException();
    }
  }

  void addFavouriteProduct(Map<String, dynamic> data) {
    try {
      state = state.copywith(
        favouriteProducts: [...state.favouriteProducts, data],
      );
    } on Exception catch (ex) {
      ex.logException();
    }
  }

  void removeFavouriteProduct(Map<String, dynamic> data) {
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

  void removeProduct(Map<String, dynamic> data) {
    try {
      state = state.copywith(
        cartProducts: state.cartProducts
            .where((element) => element['name'] != data['name'])
            .toList(),
      );
    } on Exception catch (ex) {
      ex.logException();
    }
  }

  void clearAllItems() {
    try {
      state = state.copywith(cartProducts: []);
    } on Exception catch (ex) {
      ex.logException();
    }
  }

  void addAllItems(List<Map<String, dynamic>> data) {
    try {
      state = state.copywith(cartProducts: [...data]);
    } on Exception catch (ex) {
      ex.logException();
    }
  }

  void navigateToHomeScreen() {
    try {
      pop();
    } on Exception catch (ex) {
      ex.logException();
    }
  }
}
