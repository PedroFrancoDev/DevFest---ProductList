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
    final size = MediaQuery.of(context).size;
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            const Carousel(),
            HeaderTitle(title: "Produtos em Alta", istitleRigth: false, horizontalPadding: 24,),
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 20,
                childAspectRatio: size.width / (size.height * 0.71),
                children: List.generate(10, (index) {
                  return ProductCard();
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
