class ProductEntity {
  final String id;
  final String name;
  final double price;
  final String mainImage;
  final List<String> images;
  final bool isFavorite;
  final List<int> sizes;
  final String description;
  final double rating;

  ProductEntity({
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
}
