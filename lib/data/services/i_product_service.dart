import 'package:dartz/dartz.dart';
import 'package:dev_fest_product_list/data/models/product.dart';
import 'package:dev_fest_product_list/domain/failures/failure.dart';

abstract class IProductService {
  Future<Either<Failure, List<ProductModel>>> getProducts();
  Future<Either<Failure, bool>> createProduct();
  Future<Either<Failure, bool>> addToFavorites(String productId);
  Future<Either<Failure, bool>> removeFromFavorites(String productId);
}
