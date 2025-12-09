import 'package:dev_fest_product_list/data/models/product.dart';
import 'package:dev_fest_product_list/data/repository/i_product_repository.dart';
import 'package:dev_fest_product_list/utils/snackbar_helper.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final IProductRepository _productRepository;

  HomeViewModel({required IProductRepository productRepository})
    : _productRepository = productRepository;

  final List<ProductModel> products = [];
  bool isHomeLoading = false;

  void geAllProducts() async {
    isHomeLoading = true;
    notifyListeners();

    final result = await _productRepository.geAllProducts();

    result.fold(
      (l) {
        isHomeLoading = false;
        notifyListeners();
      },
      (r) {
        products.clear();
        products.addAll(r);
        isHomeLoading = false;
        notifyListeners();
      },
    );
  }

  Future<void> removeOrAddProductToFavorites({
    required String productId,
    required BuildContext context,
    required bool isFavorite,
  }) async {
    final result = isFavorite
        ? await _productRepository.addToFavorites(productId)
        : await _productRepository.removeFromFavorites(productId);

    result.fold(
      (failure) => SnackbarHelper.showModernMessage(
        context,
        failure.message,
        type: MessageType.error,
      ),
      (success) {
        return;
      },
    );
  }
}
