import 'package:dev_fest_product_list/domain/entities/banner/banner_entity.dart';
import 'package:dev_fest_product_list/domain/entities/product/product_entity.dart';
import 'package:dev_fest_product_list/data/repository/i_banner_repository.dart';
import 'package:dev_fest_product_list/data/repository/i_product_repository.dart';
import 'package:dev_fest_product_list/utils/snackbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class HomeViewModel extends ChangeNotifier {
  final IProductRepository _productRepository;
  final IBannerRepository _iBannerRepository;

  HomeViewModel({
    required IProductRepository productRepository,
    required IBannerRepository iBannerRepository,
  }) : _productRepository = productRepository,
       _iBannerRepository = iBannerRepository;

  List<ProductEntity> products = [];
  List<BannerEntity> bannerImages = [];

  bool isHomeLoading = false;
  bool isSearchMode = false;

  Future<void> geAllProducts() async {
    isHomeLoading = true;
    isSearchMode = false;
    notifyListeners();

    final result = await _productRepository.geAllProducts();

    result.fold(
      (failure) {
        isHomeLoading = false;
        notifyListeners();
        Logger().e(failure);
      },
      (productsResponse) {
        products = productsResponse.map((e) => e.toEntity()).toList();
        isHomeLoading = false;
        notifyListeners();
      },
    );
  }

  Future<void> getAllBannerImages() async {
    final result = await _iBannerRepository.getBannerImages();
    result.fold((failure) => Logger().e(failure), (response) {
      bannerImages = response.map((e) => e.toEntity()).toList();
      notifyListeners();
    });
  }

  Future<void> searchProducts(String query) async {
    if (query.isEmpty) {
      geAllProducts();
      return;
    }

    isHomeLoading = true;
    isSearchMode = true;
    notifyListeners();

    final result = await _productRepository.searchProducts(query);

    result.fold(
      (failure) {
        isHomeLoading = false;
        notifyListeners();
        Logger().e(failure);
      },
      (productsResponse) {
        products = productsResponse.map((e) => e.toEntity()).toList();
        isHomeLoading = false;
        notifyListeners();
      },
    );
  }

  Future<void> toggleFavoriteStatus({
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
      (success) => Logger().i("Status de favorito alterado"),
    );
  }
}
