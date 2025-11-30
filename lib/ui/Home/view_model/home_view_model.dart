import 'package:dev_fest_product_list/data/repository/product_repository.dart';

class HomeViewModel {
  final ProductRepository productRepository;
  
  HomeViewModel({required this.productRepository});

  void testPrint() {
    productRepository.geAllProducts();
  }
}