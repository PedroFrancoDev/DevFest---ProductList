import 'package:dev_fest_product_list/domain/entities/product/product_entity.dart';

class ProductDto {
  final String id;
  final String name;
  final double price;
  final String mainImage;
  final List<String> images;
  final bool isFavorite;
  final List<int> sizes;
  final String description;
  final double rating;

  ProductDto({
    required this.id,
    required this.name,
    required this.price,
    required this.mainImage,
    required this.images,
    required this.isFavorite,
    required this.sizes,
    required this.description,
    required this.rating,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) {
    return ProductDto(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      mainImage: json['mainImage'] as String,
      images: List<String>.from(json['images'] as List),
      isFavorite: json['isFavorite'] as bool,
      sizes: List<int>.from(json['sizes'] as List),
      description: json['description'] as String,
      rating: (json['rating'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'mainImage': mainImage,
      'images': images,
      'isFavorite': isFavorite,
      'sizes': sizes,
      'description': description,
      'rating': rating,
    };
  }

  ProductDto copyWith({
    String? id,
    String? name,
    double? price,
    String? mainImage,
    List<String>? images,
    bool? isFavorite,
    List<int>? sizes,
    String? description,
    double? rating,
  }) {
    return ProductDto(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      mainImage: mainImage ?? this.mainImage,
      images: images ?? this.images,
      isFavorite: isFavorite ?? this.isFavorite,
      sizes: sizes ?? this.sizes,
      description: description ?? this.description,
      rating: rating ?? this.rating,
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      name: name,
      price: price,
      mainImage: mainImage,
      images: images,
      isFavorite: isFavorite,
      sizes: sizes,
      description: description,
      rating: rating,
    );
  }
}
