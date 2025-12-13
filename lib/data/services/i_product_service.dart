import 'package:dartz/dartz.dart';
import 'package:dev_fest_product_list/data/models/banner.dart';
import 'package:dev_fest_product_list/data/models/product.dart';
import 'package:dev_fest_product_list/domain/failures/failure.dart';

abstract class IFirebaseService {
  Future<Either<Failure, List<ProductModel>>> getProducts();
  Future<Either<Failure, List<BannerModel>>> getBannerImages();
  Future<Either<Failure, bool>> createProductList(List<ProductModel> products);
  Future<Either<Failure, bool>> addToFavorites(String productId);
  Future<Either<Failure, bool>> addBannerImages(List<BannerModel> bannerImages);
  Future<Either<Failure, bool>> removeFromFavorites(String productId);
}
