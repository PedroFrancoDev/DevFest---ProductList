import 'package:dev_fest_product_list/domain/entities/product/product_entity.dart';
import 'package:dev_fest_product_list/data/repository/i_product_repository.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewModel extends ChangeNotifier {
  final IProductRepository _productRepository;

  ProductDetailsViewModel({required IProductRepository productRepository})
    : _productRepository = productRepository;
  ProductEntity product = ProductEntity(
    id: '',
    name: '',
    price: 0.0,
    mainImage: '',
    sizes: [],
    description: '',
    rating: 0.0,
    images: [],
    isFavorite: false,
  );

  bool isProductDetailsLoading = false;

  Future<void> fetchProductDetails(String productId) async {
    isProductDetailsLoading = true;
    notifyListeners();

    final result = await _productRepository.getProductById(productId);

    result.fold(
      (l) {
        isProductDetailsLoading = false;
        notifyListeners();
      },
      (r) {
        product = r.toEntity();
        isProductDetailsLoading = false;
        notifyListeners();
      },
    );
  }
}
