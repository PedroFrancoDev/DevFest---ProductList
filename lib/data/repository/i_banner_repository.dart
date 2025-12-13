import 'package:dartz/dartz.dart';
import 'package:dev_fest_product_list/data/models/banner.dart';
import 'package:dev_fest_product_list/domain/failures/failure.dart';

abstract class IBannerRepository {
  Future<Either<Failure, bool>> addBannerImages(List<BannerModel> bannerImages);
  Future<Either<Failure, List<BannerModel>>> getBannerImages();
}
