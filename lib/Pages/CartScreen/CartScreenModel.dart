class CartScreenModel {
  List<Map<String, dynamic>> cartProducts;
  List<Map<String, dynamic>> favouriteProducts;

  CartScreenModel({
    required this.cartProducts,
    required this.favouriteProducts,
  });

  CartScreenModel copywith({
    List<Map<String, dynamic>>? cartProducts,
    List<Map<String, dynamic>>? favouriteProducts,
  }) {
    return CartScreenModel(
      cartProducts: cartProducts ?? this.cartProducts,
      favouriteProducts: favouriteProducts ?? this.favouriteProducts,
    );
  }
}
