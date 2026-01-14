class FavouriteScreenModel {
  List<Map<String, dynamic>> favouriteProducts;

  FavouriteScreenModel({required this.favouriteProducts});

  FavouriteScreenModel copywith({List<Map<String, dynamic>>? favouriteProducts}) {
    return FavouriteScreenModel(favouriteProducts: favouriteProducts ?? []);
  }
}
