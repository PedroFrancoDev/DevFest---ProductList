import 'package:carousel_slider/carousel_slider.dart';
import 'package:dev_fest_product_list/ui/Home/view/widget/carousel/imagens.dart';
import 'package:dev_fest_product_list/ui/core/theme/colors.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  final double marginSize;

  const Carousel({super.key, this.marginSize = 18});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 150,
            aspectRatio: 2.2,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: images.map((imgPath) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: widget.marginSize),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(imgPath),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withAlpha(
                      (0.15 * 255).toInt(),
                    ),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
              decoration: BoxDecoration(
                color: AppColors.primary.withAlpha((0.25 * 255).toInt()),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(images.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: _currentIndex == index ? 14 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: _currentIndex == index
                          ? AppColors.primary
                          : Colors.grey.withAlpha(
                              (0.4 * 255).toInt(),
                            ),
                    ),
                  );
                }),
              ),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
