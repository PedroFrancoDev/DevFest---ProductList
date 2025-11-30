import 'package:dev_fest_product_list/ui/core/theme/colors.dart';
import 'package:dev_fest_product_list/ui/core/widgets/app_bar.dart';
import 'package:dev_fest_product_list/ui/core/widgets/images_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int _currentImage = 0;
  int _selectedSize = 1;

  final List<String> images = [
    "https://static.nike.com/a/images/t_web_pdp_535_v2/f_auto/acf0beb1-6ced-4ac1-b36f-dae423fbc57a/NIKE+SHOX+R4.png",
    "https://static.nike.com/a/images/t_web_pdp_535_v2/f_auto/acf0beb1-6ced-4ac1-b36f-dae423fbc57a/NIKE+SHOX+R4.png",
    "https://static.nike.com/a/images/t_web_pdp_535_v2/f_auto/acf0beb1-6ced-4ac1-b36f-dae423fbc57a/NIKE+SHOX+R4.png",
  ];

  final List<String> sizes = ["S", "M", "L", "XL", "XXL"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        onTap: () {
          Navigator.of(context).pop();
        },
        title: 'Favoritos',
        actionIcon: SvgPicture.asset(
          "assets/notification.svg",
          width: 24,
          height: 24,
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImagesSlide(
              isProductImages: true,
              imagesLink: images,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.asMap().entries.map((entry) {
                return Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentImage == entry.key
                        ? Colors.black
                        : Colors.black26,
                  ),
                );
              }).toList(),
            ),
        
            const SizedBox(height: 12),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "DR CRZ Jacket",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
        
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      SizedBox(width: 4),
                      Text(
                        "4.9 (1283 Reviews)",
                        style: TextStyle(fontSize: 14, color: AppColors.primaryDark4,
                        ),
                      ),
                    ],
                  ),
        
                  const SizedBox(height: 12),
        
                  const Text(
                    "\$69.00",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryDark4,
                    ),
                  ),
                ],
              ),
            ),
        
            const SizedBox(height: 24),
        
            // 📏 TAMANHOS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: const Text(
                "Size",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
        
            const SizedBox(height: 10),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Wrap(
                spacing: 12,
                children: List.generate(sizes.length, (index) {
                  bool selected = _selectedSize == index;
        
                  return GestureDetector(
                    onTap: () {
                      setState(() => _selectedSize = index);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: selected ? AppColors.primary : Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: AppColors.primary),
                      ),
                      child: Text(
                        sizes[index],
                        style: TextStyle(
                          color: selected ? Colors.white : AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
        
            const SizedBox(height: 28),
        
            // 📄 DESCRIÇÃO
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Description",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
        
            const SizedBox(height: 8),
        
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "A stylish and versatile piece designed to provide both fashion and functionality. Crafted with attention to detail.",
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.primaryDark4,
                  height: 1.5,
                ),
              ),
            ),
        
            const SizedBox(height: 100),
          ],
        ),
      ),

      // 🛒 Botão fixo igual ao do mockup
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(24),
        child: SizedBox(
          height: 56,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            onPressed: () {},
            child: const Text(
              "Add to Cart",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
