import 'package:dev_fest_product_list/data/models/product.dart';
import 'package:dev_fest_product_list/data/repository/i_product_repository.dart';
import 'package:flutter/material.dart';

class FavoriteViewModel extends ChangeNotifier {
  final IProductRepository _productRepository;

  FavoriteViewModel({required IProductRepository productRepository})
    : _productRepository = productRepository;

  final List<ProductModel> favoriteProducts = [];
  bool isFavoriteViewLoading = false;

  void getFavoriteProducts() async {
    isFavoriteViewLoading = true;
    notifyListeners();

    final result = await _productRepository.geAllProducts();

    result.fold(
      (l) {
        isFavoriteViewLoading = false;
        notifyListeners();
      },
      (r) {
        favoriteProducts.clear();

        favoriteProducts.addAll(r.where((e) => e.isFavorite));

        isFavoriteViewLoading = false;
        notifyListeners();
      },
    );
  }
}
