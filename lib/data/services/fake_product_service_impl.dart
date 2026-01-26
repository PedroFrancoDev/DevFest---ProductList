import 'package:dartz/dartz.dart';
import 'package:dev_fest_product_list/data/models/dto/banner/banner_dto.dart';
import 'package:dev_fest_product_list/data/models/dto/product/product_dto.dart';
import 'package:dev_fest_product_list/data/services/i_product_service.dart';
import 'package:dev_fest_product_list/domain/failures/failure.dart';

class FakeProductService implements IFirebaseService {
  @override
  Future<Either<Failure, List<ProductDto>>> getProducts() async {
    await Future.delayed(const Duration(milliseconds: 400));

    return Right([
      ProductDto(
        id: '1',
        name: "New Balance 574",
        price: 149.99,
        mainImage:
            "https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg",
        images: [
          "https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg",
          "https://images.pexels.com/photos/19090/pexels-photo.jpg",
          "https://images.pexels.com/photos/267202/pexels-photo-267202.jpeg",
        ],
        isFavorite: false,
        sizes: [38, 39, 40, 41, 42],
        description:
            "O New Balance 574 traz um design clássico com foco em estabilidade e conforto diário.",
        rating: 4.6,
      ),

      ProductDto(
        id: '2',
        name: "Nike Air Force 1",
        price: 169.99,
        mainImage:
            "https://images.pexels.com/photos/1456738/pexels-photo-1456738.jpeg",
        images: [
          "https://images.pexels.com/photos/1456738/pexels-photo-1456738.jpeg",
          "https://images.pexels.com/photos/292999/pexels-photo-292999.jpeg",
          "https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg",
        ],
        isFavorite: false,
        sizes: [39, 40, 41, 42, 43, 44],
        description:
            "O Nike Air Force 1 é um ícone do streetwear, combinando robustez e estilo atemporal.",
        rating: 4.8,
      ),

      ProductDto(
        id: '3',
        name: "Adidas NMD R1",
        price: 179.99,
        mainImage: "https://images.pexels.com/photos/19090/pexels-photo.jpg",
        images: [
          "https://images.pexels.com/photos/19090/pexels-photo.jpg",
          "https://images.pexels.com/photos/267202/pexels-photo-267202.jpeg",
          "https://images.pexels.com/photos/292999/pexels-photo-292999.jpeg",
        ],
        isFavorite: false,
        sizes: [38, 39, 40, 41, 42],
        description:
            "O Adidas NMD R1 combina conforto extremo com visual minimalista moderno.",
        rating: 4.4,
      ),

      ProductDto(
        id: '4',
        name: "Asics Gel-Kayano 30",
        price: 199.99,
        mainImage:
            "https://images.pexels.com/photos/292999/pexels-photo-292999.jpeg",
        images: [
          "https://images.pexels.com/photos/292999/pexels-photo-292999.jpeg",
          "https://images.pexels.com/photos/19090/pexels-photo.jpg",
          "https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg",
        ],
        isFavorite: false,
        sizes: [40, 41, 42, 43, 44],
        description:
            "O Gel-Kayano 30 oferece estabilidade premium e tecnologia avançada para corridas longas.",
        rating: 4.9,
      ),

      ProductDto(
        id: '5',
        name: "Puma Clyde All-Pro",
        price: 139.99,
        mainImage:
            "https://images.pexels.com/photos/267202/pexels-photo-267202.jpeg",
        images: [
          "https://images.pexels.com/photos/267202/pexels-photo-267202.jpeg",
          "https://images.pexels.com/photos/292999/pexels-photo-292999.jpeg",
          "https://images.pexels.com/photos/1456738/pexels-photo-1456738.jpeg",
        ],
        isFavorite: false,
        sizes: [38, 39, 40, 41, 42, 44],
        description:
            "O Puma Clyde All-Pro traz leveza e suporte ideal para treinos e uso diário.",
        rating: 4.3,
      ),

      ProductDto(
        id: '6',
        name: "Vans Old Skool",
        price: 119.99,
        mainImage:
            "https://images.pexels.com/photos/1456738/pexels-photo-1456738.jpeg",
        images: [
          "https://images.pexels.com/photos/1456738/pexels-photo-1456738.jpeg",
          "https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg",
          "https://images.pexels.com/photos/267202/pexels-photo-267202.jpeg",
        ],
        isFavorite: false,
        sizes: [37, 38, 39, 40, 41, 42],
        description:
            "O Vans Old Skool é um clássico do skate, conhecido pela durabilidade e estilo casual.",
        rating: 4.2,
      ),
    ]);
  }
  
  @override
  Future<Either<Failure, bool>> createProductList(List<ProductDto> products) {
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, bool>> addToFavorites(String productId) {
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, bool>> removeFromFavorites(String productId) {
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, bool>> addBannerImages(
    List<BannerDto> bannerImages) {
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, List<BannerDto>>> getBannerImages() {
    throw UnimplementedError();
  }
}
