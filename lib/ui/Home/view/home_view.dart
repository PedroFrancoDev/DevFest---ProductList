import 'dart:async';

import 'package:dev_fest_product_list/config/di/injector.dart';

import 'package:dev_fest_product_list/ui/Home/view/widget/carousel/carousel_page.dart';
import 'package:dev_fest_product_list/ui/Home/view_model/home_view_model.dart';
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
  late final HomeViewModel viewModel;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    viewModel = HomeViewModel(
      productRepository: getIt(),
      iBannerRepository: getIt(),
    );
    viewModel.geAllProducts();
    viewModel.getAllBannerImages();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      viewModel.searchProducts(query.trim());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'DevFest Product List',
        hasBackButton: false,
        actionIcon: SvgPicture.asset("assets/notification.svg", width: 24),
        onTap: () {},
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          _buildSearchSection(),
          Expanded(
            child: ListenableBuilder(
              listenable: viewModel,
              builder: (context, _) {
                if (viewModel.isHomeLoading) {
                  return const Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () => viewModel.geAllProducts(),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        if (!viewModel.isSearchMode) ...[
                          const SizedBox(height: 16),
                          Carousel(),
                        ],

                        const SizedBox(height: 24),
                        HeaderTitle(
                          title: viewModel.isSearchMode
                              ? "Resultados da Busca"
                              : "Produtos em Alta",
                          horizontalPadding: 24,
                        ),

                        _buildProductGrid(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                onChanged: _onSearchChanged,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: SvgPicture.asset("assets/Search.svg", width: 20),
                  hintText: "Buscar produtos",
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          _buildFilterButton(),
        ],
      ),
    );
  }

  Widget _buildFilterButton() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SvgPicture.asset(
        "assets/Filter.svg",
        width: 20,
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
    );
  }

  Widget _buildProductGrid() {
    if (viewModel.products.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 100),
        child: Text("Nenhum produto encontrado."),
      );
    }

    return GridView.builder(
      itemCount: viewModel.products.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final product = viewModel.products[index];
        return ProductCard(
          product: product,
          toggleFavoriteStatus: (isFav) => viewModel.toggleFavoriteStatus(
            productId: product.id,
            context: context,
            isFavorite: isFav,
          ),
        );
      },
    );
  }
}
