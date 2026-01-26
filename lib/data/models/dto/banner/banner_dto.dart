import 'package:dev_fest_product_list/domain/entities/banner/banner_entity.dart';

class BannerDto {
  late List<String> imageUrls;

  BannerDto({required this.imageUrls});

  BannerDto.fromJson(Map<String, dynamic> json) {
    imageUrls = List<String>.from(json['imageUrls']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageUrls'] = imageUrls;
    return data;
  }

  BannerEntity toEntity() {
    return BannerEntity(imageUrls: imageUrls);
  }
}
