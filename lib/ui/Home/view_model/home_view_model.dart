import 'package:dev_fest_product_list/data/models/entities/banner/banner_entity.dart';
import 'package:dev_fest_product_list/data/models/entities/product/product_entity.dart';
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

  final List<ProductEntity> products = [];
  final List<BannerEntity> bannerImages = [];

  bool isHomeLoading = false;

  void geAllProducts() async {
    isHomeLoading = true;
    notifyListeners();

    final result = await _productRepository.geAllProducts();

    result.fold(
      (failure) {
        isHomeLoading = false;
        notifyListeners();
      },
      (productsResponse) {
        products.clear();
        products.addAll(productsResponse.map((e) => e.toEntity()));
        isHomeLoading = false;
        notifyListeners();
      },
    );
  }

  void getAllBannerImages() async {
    final result = await _iBannerRepository.getBannerImages();

    result.fold((_) {}, (r) {
      products.clear();
      bannerImages.addAll(r.map((e) => e.toEntity()));
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
      (favoriteProductResponse) {
        return;
      },
    );
  }
}
