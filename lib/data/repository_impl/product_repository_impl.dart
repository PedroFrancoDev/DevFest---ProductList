import 'package:dartz/dartz.dart';
import 'package:dev_fest_product_list/data/models/product.dart';
import 'package:dev_fest_product_list/data/repository/i_product_repository.dart';
import 'package:dev_fest_product_list/data/services/fake_product_service.dart';
import 'package:dev_fest_product_list/domain/failures/failure.dart';

class ProductRepositoryImpl implements IProductRepository {
  final FakeProductService productService;

  ProductRepositoryImpl({required this.productService});

  @override
  Future<Either<Failure, List<ProductModel>>> geAllProducts() async {
    final products = await productService.getProducts();

    return Future.value(Right(products));
  }

  @override
  Future<Either<Failure, ProductModel>> getProductById(String id) async {
    final products = await productService.getProducts();

    try {
      final product = products.firstWhere((product) => product.id == id);
      return Right(product);
    } catch (e) {
      return Left(Failure(message: 'Falha ao buscar o produto'));
    }
  }

  @override
  Future<Either<Failure, bool>> addToFavorites(String productId) {
    // TODO: implement addToFavorites
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> removeFromFavorites(String productId) {
    // TODO: implement removeFromFavorites
    throw UnimplementedError();
  }
}
