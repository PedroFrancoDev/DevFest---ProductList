import 'package:dartz/dartz.dart';
import 'package:dev_fest_product_list/data/models/dto/banner/banner_dto.dart';
import 'package:dev_fest_product_list/data/models/dto/product/product_dto.dart';
import 'package:dev_fest_product_list/domain/failures/failure.dart';

abstract class IFirebaseService {
  Future<Either<Failure, List<ProductDto>>> getProducts();
  Future<Either<Failure, List<BannerDto>>> getBannerImages();
  Future<Either<Failure, bool>> createProductList(List<ProductDto> products);
  Future<Either<Failure, bool>> addToFavorites(String productId);
  Future<Either<Failure, bool>> addBannerImages(List<BannerDto> bannerImages);
  Future<Either<Failure, bool>> removeFromFavorites(String productId);
  Future<Either<Failure, List<ProductDto>>> searchProducts(String query);
}
