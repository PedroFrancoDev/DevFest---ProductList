import 'package:dev_fest_product_list/domain/entities/product/product_entity.dart';
import 'package:dev_fest_product_list/data/repository/i_product_repository.dart';
import 'package:dev_fest_product_list/utils/snackbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class FavoriteViewModel extends ChangeNotifier {
  final IProductRepository _productRepository;

  FavoriteViewModel({required IProductRepository productRepository})
    : _productRepository = productRepository;

  final List<ProductEntity> favoriteProducts = [];
  bool isFavoriteViewLoading = false;

  void getFavoriteProducts() async {
    isFavoriteViewLoading = true;
    notifyListeners();

    final result = await _productRepository.geAllProducts();

    result.fold(
      (failure) {
        isFavoriteViewLoading = false;
        notifyListeners();
        Logger().e(failure.message);
      },
      (favoriteProductsResponse) {
        favoriteProducts.clear();

        favoriteProducts.addAll(
          favoriteProductsResponse.where((e) => e.isFavorite).map((e) => e.toEntity()),
        );

        isFavoriteViewLoading = false;
        notifyListeners();
        Logger().i(favoriteProducts);
      },
    );
  }

  void removeProductToFavorites({
    required String productId,
    required BuildContext context,
  }) async {
    isFavoriteViewLoading = true;
    notifyListeners();

    final result = await _productRepository.removeFromFavorites(productId);

    result.fold(
      (failure) {
        isFavoriteViewLoading = false;
        notifyListeners();

        SnackbarHelper.showModernMessage(
          context,
          failure.message,
          type: MessageType.error,
        );

        Logger().e(failure.message);
      },
      (success) {
        favoriteProducts.removeWhere((product) => product.id == productId);

        isFavoriteViewLoading = false;
        notifyListeners();
        Logger().i(success);
      },
    );
  }

}
