import 'package:flutter_riverpod/legacy.dart';
import 'package:food_ui/Helpers/Navigations/NavigationConfig.dart';
import 'package:food_ui/Helpers/Navigations/NavigationMixin.dart';
import 'package:food_ui/Helpers/Utility/ErrorHandling.dart';
import 'package:food_ui/Pages/HomeScreen/HomeScreenModel.dart';
import 'package:food_ui/Services/CartService/CartService.dart';
import 'package:food_ui/Services/CartService/ICartService.dart';

class HomeScreenVM extends StateNotifier<HomeScreenModel> with NavigationMixin {
  HomeScreenVM()
    : super(
        HomeScreenModel(
          selectedTabIndex: 0,
          products: [],
          groupedProducts: {},
          favorites: [],
          searchQuery: '',
          cartProducts: [],
        ),
      ) {
    fetchAllProducts();
  }

  Future<void> fetchAllProducts() async {
    try {
      ICartSevice cartSevice = CartService();

      var result = await cartSevice.getAllProducts();

      state = state.copyWith(products: result);

      groupProductsByCategory();
    } on Exception catch (ex) {
      ex.logException();
    }
  }

  void groupProductsByCategory() {
    try {
      state = state.copyWith(groupedProducts: {});

      for (var product in state.products) {
        String category = product['category'];

        if (!state.groupedProducts.containsKey(category)) {
          state = state.copyWith(
            groupedProducts: {...state.groupedProducts, category: []},
          );
        }
        state = state.copyWith(
          groupedProducts: {
            ...state.groupedProducts,
            category: [...state.groupedProducts[category]!, product],
          },
        );
      }
    } on Exception catch (ex) {
      ex.logException();
    }
  }

  void updateCurrentIndex(int index) {
    try {
      state = state.copyWith(selectedTabIndex: index);
    } on Exception catch (ex) {
      ex.logException();
    }
  }

  Future<void> toggleFavorite(Map<String, dynamic> product) async {
    try {
      final isFavorite = state.favorites.any(
        (element) => element['id'] == product['id'],
      );

      if (isFavorite) {
        state = state.copyWith(
          favorites: state.favorites
              .where((element) => element['id'] != product['id'])
              .toList(),
        );
      } else {
        state = state.copyWith(favorites: [...state.favorites, product]);
      }
    } on Exception catch (ex) {
      ex.logException();
    }
  }

  void removeFavProduct(Map<String, dynamic> product) {
    try {
      state = state.copyWith(
        favorites: state.favorites
            .where((element) => element['id'] != product['id'])
            .toList(),
      );
    } on Exception catch (ex) {
      ex.logException();
    }
  }

  Future<void> toggleCart(Map<String, dynamic> product) async {
    try {
      final isCart = state.cartProducts.any(
        (element) => element['id'] == product['id'],
      );

      if (isCart) {
        state = state.copyWith(
          cartProducts: state.cartProducts
              .where((element) => element['id'] != product['id'])
              .toList(),
        );
      } else {
        state = state.copyWith(cartProducts: [...state.cartProducts, product]);
      }
    } on Exception catch (ex) {
      ex.logException();
    }
  }

  void removeCartProduct(Map<String, dynamic> product) {
    try {
      state = state.copyWith(
        cartProducts: state.cartProducts
            .where((element) => element['id'] != product['id'])
            .toList(),
      );
    } on Exception catch (ex) {
      ex.logException();
    }
  }

  void navigateToCartScreen() {
    try {
      push(NavigationConfig.cartScreen);
    } on Exception catch (ex) {
      ex.logException();
    }
  }
}
