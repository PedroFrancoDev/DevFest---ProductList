import 'package:dev_fest_product_list/config/di/injector.dart';
import 'package:dev_fest_product_list/data/models/product.dart';
import 'package:dev_fest_product_list/data/repository/i_product_repository.dart';
import 'package:dev_fest_product_list/ui/core/theme/colors.dart';
import 'package:dev_fest_product_list/ui/favorites/view_model/favorite_view_model.dart';
import 'package:dev_fest_product_list/ui/product_details/view/product_details_view.dart';
import 'package:dev_fest_product_list/ui/core/widgets/app_bar.dart';
import 'package:dev_fest_product_list/ui/core/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final viewModel = FavoriteViewModel(productRepository: getIt.get<IProductRepository>());

  @override
  void initState() {
    super.initState();

    viewModel.getFavoriteProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onTap: () {
          Navigator.of(context).pop();
        },
        hasBackButton: false,
        title: 'Favoritos',
        actionIcon: SvgPicture.asset(
          "assets/notification.svg",
          width: 24,
          height: 24,
        ),
      ),
      backgroundColor: Colors.white,
      body: ListenableBuilder(listenable: viewModel, builder: (context, _) {
        if(viewModel.isFavoriteViewLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.primaryDark3,
            ),
          );
        }

        return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: GridView.builder(
            itemCount: viewModel.favoriteProducts.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              final ProductModel favoriteProduct = viewModel.favoriteProducts[index];

              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsPage(productId: favoriteProduct.id,),
                    ),
                  );
                },
                child: ProductCard(
                  product: favoriteProduct,
                ),
              );
            },
          ),
        ),
      );
      })    );
  }
}
