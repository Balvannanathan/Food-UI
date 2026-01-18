import 'package:flutter_riverpod/legacy.dart';
import 'package:food_ui/Pages/CartScreen/CartScreenModel.dart';
import 'package:food_ui/Pages/CartScreen/CartScreenVM.dart';

final cartProvider = StateNotifierProvider<CartProvider, CartScreenModel>(
  (ref) => CartProvider(),
);
