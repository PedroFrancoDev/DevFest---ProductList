import 'package:dev_fest_product_list/data/repository/i_product_repository.dart';
import 'package:dev_fest_product_list/utils/snackbar_helper.dart';
import 'package:flutter/material.dart';

class RegisterProductsViewModel extends ChangeNotifier {
  final IProductRepository _productRepository;

  RegisterProductsViewModel({required IProductRepository productRepository})
    : _productRepository = productRepository;

  bool isLoading = false;

  void createProduct(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    final result = await _productRepository.createProduct();

    result.fold(
      (l) {
        isLoading = false;
        notifyListeners();
        SnackbarHelper.showModernMessage(
          context,
          l.message,
          type: MessageType.error,
        );
      },
      (r) {
        isLoading = false;
        notifyListeners();
        SnackbarHelper.showModernMessage(
          context,
          "Produtos adicionados com sucesso!",
          type: MessageType.success,
        );
      },
    );
  }
}
