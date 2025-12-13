import 'package:dev_fest_product_list/config/di/injector.dart';
import 'package:dev_fest_product_list/data/repository/i_banner_repository.dart';
import 'package:dev_fest_product_list/data/repository/i_product_repository.dart';
import 'package:dev_fest_product_list/ui/core/theme/colors.dart';
import 'package:dev_fest_product_list/ui/core/widgets/app_bar.dart';
import 'package:dev_fest_product_list/ui/register_product/view_model/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegisterProducts extends StatefulWidget {
  const RegisterProducts({super.key});

  @override
  State<RegisterProducts> createState() => _RegisterProductsState();
}

class _RegisterProductsState extends State<RegisterProducts> {
  final viewModel = RegisterProductsViewModel(
    productRepository: getIt.get<IProductRepository>(),
    bannerRepository: getIt.get<IBannerRepository>(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onTap: () {
          Navigator.of(context).pop();
        },
        hasBackButton: false,
        title: 'Cadastrar Produtos',
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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButtonWidget(
                isLoading: viewModel.isCreatingProducts,
                text: "Criar lista de Produtos",
                onTap: () => viewModel.createProduct(context),
              ),
              SizedBox(height: 10),
              _buildButtonWidget(
                isLoading: viewModel.isAddingBanners,
                text: "Adicionar Imagens do Banner",
                onTap: () => viewModel.addBannerImages(context),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildButtonWidget({
    required String text,
    required void Function()? onTap,
    required bool isLoading,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        height: 54,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 28),
          ),
          onPressed: onTap,
          child: isLoading
              ? SizedBox(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : Text(
                  text,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
