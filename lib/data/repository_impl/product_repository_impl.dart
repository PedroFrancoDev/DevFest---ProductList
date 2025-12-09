import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dev_fest_product_list/data/models/product.dart';
import 'package:dev_fest_product_list/data/repository/i_product_repository.dart';
import 'package:dev_fest_product_list/data/services/i_product_service.dart';
import 'package:dev_fest_product_list/domain/failures/failure.dart';
import 'package:dev_fest_product_list/utils/firebase_error_messages.dart';

class ProductRepositoryImpl implements IProductRepository {
  final IProductService productService;

  ProductRepositoryImpl({required this.productService});

  @override
  Future<Either<Failure, List<ProductModel>>> geAllProducts() async {
    final products = await productService.getProducts();

    return Future.value(products);
  }

  @override
  Future<Either<Failure, ProductModel>> getProductById(String id) async {
    final products = await productService.getProducts();

    try {
      final product = products.fold(
        (l) => l,
        (r) => r.firstWhere((product) => product.id == id),
      );
      return product is Failure
          ? Left(product)
          : Right(product as ProductModel);
    } on FirebaseException catch (e) {
      return Left(Failure(message: FirebaseErrorMessages.fromException(e)));
    }
  }

  @override
  Future<Either<Failure, bool>> addToFavorites(String productId) async {
    try {
      productService.addToFavorites(productId);
      return Right(true);
    } on FirebaseException catch (e) {
      return Left(Failure(message: FirebaseErrorMessages.fromException(e)));
    }
  }

  @override
  Future<Either<Failure, bool>> removeFromFavorites(String productId) async {
    try {
      productService.removeFromFavorites(productId);
      return Right(true);
    } on FirebaseException catch (e) {
      return Left(Failure(message: FirebaseErrorMessages.fromException(e)));
    }
  }

  @override
  Future<Either<Failure, bool>> createProduct() async {
    final result = await productService.createProduct();

    result.fold((l) => Left(l), (r) => Right(r));

    return Future.value(result);
  }
}
