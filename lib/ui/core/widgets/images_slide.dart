import 'package:dev_fest_product_list/ui/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';

class ImagesSlide extends StatelessWidget {
  final bool isProductImages;
  final List? imagesLink;
  final List<String>? onboardingImage;

  const ImagesSlide({
    super.key,
    required this.isProductImages,
    this.imagesLink,
    this.onboardingImage,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _buildProductSlideImages(context),
    );
  }

  Widget _buildProductSlideImages(BuildContext context) {
    final List<String> images = imagesLink?.map((image) {
      if (image is String) return image;
      if (image != null && image.url != null) return image.url;
      return "";
    }).toList().cast<String>() ?? [""];

    return FanCarouselImageSlider.sliderType2(
      imagesLink: images,
      isAssets: false,
      autoPlay: false,
      sliderDuration: const Duration(milliseconds: 200),
      imageRadius: 0,
      slideViewportFraction: 1.2,
      indicatorActiveColor: AppColors.primary,
      imageFitMode: BoxFit.contain,
      currentItemShadow: [],
      sideItemsShadow: [],
    );
  }
}
