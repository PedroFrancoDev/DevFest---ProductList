import 'package:dartz/dartz.dart';
import 'package:dev_fest_product_list/data/models/dto/product/product_dto.dart';
import 'package:dev_fest_product_list/domain/failures/failure.dart';

abstract class IProductRepository {
  Future<Either<Failure, List<ProductDto>>> geAllProducts();
  Future<Either<Failure, ProductDto>> getProductById(String id);
  Future<Either<Failure, bool>> addToFavorites(String productId);
  Future<Either<Failure, bool>> removeFromFavorites(String productId);
  Future<Either<Failure, bool>> createProductList(List<ProductDto> products);
}
