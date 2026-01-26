import 'package:dartz/dartz.dart';
import 'package:dev_fest_product_list/data/models/dto/banner/banner_dto.dart';
import 'package:dev_fest_product_list/data/repository/i_banner_repository.dart';
import 'package:dev_fest_product_list/data/services/i_product_service.dart';
import 'package:dev_fest_product_list/domain/failures/failure.dart';

class BannerRepositoryImpl implements IBannerRepository {
  final IFirebaseService firebaseService;

  BannerRepositoryImpl({required this.firebaseService});

  @override
  Future<Either<Failure, List<BannerDto>>> getBannerImages() async {
    final bannerImages = await firebaseService.getBannerImages();

    return Future.value(bannerImages);
  }

  @override
  Future<Either<Failure, bool>> addBannerImages(
    List<BannerDto> bannerImages,
  ) async {
    final result = await firebaseService.addBannerImages(bannerImages);

    result.fold((l) => Left(l), (r) => Right(r));

    return Future.value(result);
  }
}
