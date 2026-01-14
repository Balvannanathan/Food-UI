import 'package:flutter_riverpod/legacy.dart';
import 'package:food_ui/Helpers/Utility/ErrorHandling.dart';
import 'package:food_ui/Pages/HomeScreen/HomeScreenModel.dart';
import 'package:food_ui/Services/CartService/CartService.dart';
import 'package:food_ui/Services/CartService/ICartService.dart';

class HomeScreenVM extends StateNotifier<HomeScreenModel> {
  HomeScreenVM()
    : super(
        HomeScreenModel(
          selectedTabIndex: 0,
          products: [],
          groupedProducts: {},
          searchQuery: '',
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
}
