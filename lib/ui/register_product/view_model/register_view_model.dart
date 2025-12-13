import 'package:dev_fest_product_list/data/models/banner.dart';
import 'package:dev_fest_product_list/data/models/product.dart';
import 'package:dev_fest_product_list/data/repository/i_banner_repository.dart';
import 'package:dev_fest_product_list/data/repository/i_product_repository.dart';
import 'package:dev_fest_product_list/ui/core/global/base_view_model.dart';
import 'package:flutter/material.dart';

class RegisterProductsViewModel extends BaseViewModel {
  final IProductRepository _productRepository;
  final IBannerRepository _bannerRepository;

  RegisterProductsViewModel({
    required IProductRepository productRepository,
    required IBannerRepository bannerRepository,
  }) : _productRepository = productRepository,
       _bannerRepository = bannerRepository;

  bool isCreatingProducts = false;
  bool isAddingBanners = false;

  final List<BannerModel> _bannerImages = [
    BannerModel(
      imageUrl:
          "https://raw.githubusercontent.com/PedroFrancoDev/DevFest---ProductList/refs/heads/main/assets/banner/1600w-oFzwfJ37fgs.webp",
    ),
    BannerModel(
      imageUrl:
          "https://raw.githubusercontent.com/PedroFrancoDev/DevFest---ProductList/refs/heads/main/assets/banner/1600w-uKpbE7SijX0.webp",
    ),
    BannerModel(
      imageUrl:
          "https://raw.githubusercontent.com/PedroFrancoDev/DevFest---ProductList/refs/heads/main/assets/banner/1600w-wVNjmpBMzos.jpg",
    ),
    BannerModel(imageUrl: "https://raw.githubusercontent.com/PedroFrancoDev/DevFest---ProductList/refs/heads/main/assets/banner/1600w-ma4cN7fRNuk.webp"),
  ];

  final List<ProductModel> _products = [
    ProductModel(
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

    ProductModel(
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

    ProductModel(
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

    ProductModel(
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

    ProductModel(
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

    ProductModel(
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
  ];

  void createProduct(BuildContext context) async {
    handleRequestWithLoading(
      setLoading: (value) => isCreatingProducts = value,
      context: context,
      operation: () => _productRepository.createProductList(_products),
      successMessage: "Produtos adicionados com sucesso!",
    );
  }

  void addBannerImages(BuildContext context) async {
    handleRequestWithLoading(
      setLoading: (value) => isAddingBanners = value,
      context: context,
      operation: () => _bannerRepository.addBannerImages(_bannerImages),
      successMessage: "Imagens do banner adicionadas com sucesso!",
    );
  }
}
