import 'package:dartz/dartz.dart';
import 'package:dev_fest_product_list/data/models/product.dart';
import 'package:dev_fest_product_list/domain/failures/failure.dart';

abstract class IProductRepository {
  Future<Either<Failure, List<ProductModel>>> geAllProducts();
  Future<Either<Failure, ProductModel>> getProductById(String id);
  Future<Either<Failure, bool>> addToFavorites(String productId);
  Future<Either<Failure, bool>> removeFromFavorites(String productId);
  Future<Either<Failure, bool>> createProduct();
}