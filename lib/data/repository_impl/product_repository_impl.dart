import 'package:dartz/dartz.dart';
import 'package:dev_fest_product_list/data/repository/product_repository.dart';
import 'package:dev_fest_product_list/domain/failures/failure.dart';
import 'package:dev_fest_product_list/domain/models/product_model.dart';

class IProductRepository implements ProductRepository {
  @override
  Future<Either<Failure, List<ProductModel>>> geAllProducts() {
    print("Pegou todos os produtos");
    return Future.value(const Right([]));
  }

  @override
  Future<Either<Failure, ProductModel>> getProductById(String id) {
    // TODO: implement getProductById
    throw UnimplementedError();
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
