import 'package:dev_fest_product_list/pages/home/widget/carousel/carousel_page.dart';
import 'package:dev_fest_product_list/theme/colors.dart';
import 'package:dev_fest_product_list/widgets/app_bar.dart';
import 'package:dev_fest_product_list/widgets/header_title.dart';
import 'package:dev_fest_product_list/widgets/product_card.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onTap: () {
          Navigator.of(context).pop();
        },
        hasBackButton: false,
        title: 'DevFest Product List',
        actionIcon: SvgPicture.asset(
          "assets/notification.svg",
          width: 24,
          height: 24,
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: buildTextField()),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SvgPicture.asset(
                  "assets/Filter.svg",
                  width: 20,
                  height: 20,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
                     const SizedBox(width: 20),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 8),

                  const Carousel(),
                  const SizedBox(height: 24),
                  HeaderTitle(
                    title: "Produtos em Alta",
                    istitleRigth: false,
                    horizontalPadding: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      bottom: 24,
                      top: 20,
                    ),
                    child: GridView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 18,
                        mainAxisSpacing: 18,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) {
                        return ProductCard();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        enabled: false,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: SvgPicture.asset("assets/Search.svg", width: 20, height: 20),
          hintText: "Buscar produtos",
          hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
        ),
      ),
    );
  }
}
