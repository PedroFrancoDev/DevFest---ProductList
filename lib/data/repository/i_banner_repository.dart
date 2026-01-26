import 'package:dartz/dartz.dart';
import 'package:dev_fest_product_list/data/models/dto/banner/banner_dto.dart';
import 'package:dev_fest_product_list/domain/failures/failure.dart';

abstract class IBannerRepository {
  Future<Either<Failure, bool>> addBannerImages(List<BannerDto> bannerImages);
  Future<Either<Failure, List<BannerDto>>> getBannerImages();
}
