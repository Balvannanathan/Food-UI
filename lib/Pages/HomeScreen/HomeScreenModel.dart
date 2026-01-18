import 'package:food_ui/Helpers/Navigations/NavigationMixin.dart';

class HomeScreenModel with NavigationMixin {
  final int selectedTabIndex;

  List<Map<String, dynamic>> products;

  Map<String, List<Map<String, dynamic>>> groupedProducts;
  List<Map<String, dynamic>> favorites;
  List<Map<String, dynamic>> cartProducts;

  String searchQuery;

  HomeScreenModel({
    required this.selectedTabIndex,
    required this.products,
    required this.groupedProducts,
    required this.favorites,
    required this.searchQuery,
    required this.cartProducts,
  });

  HomeScreenModel copyWith({
    int? selectedTabIndex,
    List<Map<String, dynamic>>? products,
    Map<String, List<Map<String, dynamic>>>? groupedProducts,
    List<Map<String, dynamic>>? favorites,
    List<Map<String, dynamic>>? cartProducts,
    String? searchQuery,
  }) {
    return HomeScreenModel(
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
      products: products ?? this.products,
      groupedProducts: groupedProducts ?? this.groupedProducts,
      favorites: favorites ?? this.favorites,
      cartProducts: cartProducts ?? this.cartProducts,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}
