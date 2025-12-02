import 'package:dev_fest_product_list/config/di/injector.dart';
import 'package:dev_fest_product_list/data/repository/i_product_repository.dart';
import 'package:dev_fest_product_list/ui/Home/view/widget/carousel/carousel_page.dart';
import 'package:dev_fest_product_list/ui/Home/view_model/home_view_model.dart';
import 'package:dev_fest_product_list/ui/product_details/view/product_details_view.dart';
import 'package:dev_fest_product_list/ui/core/theme/colors.dart';
import 'package:dev_fest_product_list/ui/core/widgets/app_bar.dart';
import 'package:dev_fest_product_list/ui/core/widgets/header_title.dart';
import 'package:dev_fest_product_list/ui/core/widgets/product_card.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel viewModel = HomeViewModel(
    productRepository: getIt<IProductRepository>(),
  );

  @override
  void initState() {
    super.initState();

    viewModel.geAllProducts();
  }

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
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, _) {
          if(viewModel.isHomeLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryDark3,
                strokeWidth: 2,
              ),
            );
          }

          return Column(
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: buildTextField()),
                  GestureDetector(
                    onTap: () => {},
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SvgPicture.asset(
                        "assets/Filter.svg",
                        width: 20,
                        height: 20,
                        colorFilter: ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
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
                          itemCount: viewModel.products.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 18,
                                mainAxisSpacing: 18,
                                childAspectRatio: 0.75,
                              ),
                          itemBuilder: (context, index) {
                            final product = viewModel.products[index];

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailsPage(productId: product.id),
                                  ),
                                );
                              },
                              child: ProductCard(product: product),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildTextField() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 12),
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
