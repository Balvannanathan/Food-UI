import 'package:food_ui/Helpers/Navigations/NavigationMixin.dart';

class HomeScreenModel with NavigationMixin {
  final int selectedTabIndex;

  List<Map<String, dynamic>> products;

  Map<String, List<Map<String, dynamic>>> groupedProducts;

  String searchQuery;

  HomeScreenModel({
    required this.selectedTabIndex,
    required this.products,
    required this.groupedProducts,
    required this.searchQuery,
  });

  HomeScreenModel copyWith({
    int? selectedTabIndex,
    List<Map<String, dynamic>>? products,
    Map<String, List<Map<String, dynamic>>>? groupedProducts,
    String? searchQuery,
  }) {
    return HomeScreenModel(
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
      products: products ?? this.products,
      groupedProducts: groupedProducts ?? this.groupedProducts,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}
