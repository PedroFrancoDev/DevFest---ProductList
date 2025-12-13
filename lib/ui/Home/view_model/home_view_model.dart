import 'package:dev_fest_product_list/data/models/banner.dart';
import 'package:dev_fest_product_list/data/models/product.dart';
import 'package:dev_fest_product_list/data/repository/i_banner_repository.dart';
import 'package:dev_fest_product_list/data/repository/i_product_repository.dart';
import 'package:dev_fest_product_list/utils/snackbar_helper.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final IProductRepository _productRepository;
  final IBannerRepository _iBannerRepository;

  HomeViewModel({
    required IProductRepository productRepository,
    required IBannerRepository iBannerRepository,
  }) : _productRepository = productRepository,
       _iBannerRepository = iBannerRepository;

  final List<ProductModel> products = [];
  final List<BannerModel> bannerImages = [];

  bool isHomeLoading = false;

  void initHomeState() {
    isHomeLoading = true;
    notifyListeners();

    geAllProducts();
    // getAllBannerImages();

    isHomeLoading = false;
    notifyListeners();
  }

  void geAllProducts() async {
    final result = await _productRepository.geAllProducts();

    result.fold((_) {}, (r) {
      products.clear();
      products.addAll(r);
    });
  }

  void getAllBannerImages() async {
    final result = await _iBannerRepository.getBannerImages();

    result.fold((_) {}, (r) {
      products.clear();
      bannerImages.addAll(r);
    });
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
