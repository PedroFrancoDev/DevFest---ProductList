import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dev_fest_product_list/data/models/banner.dart';
import 'package:dev_fest_product_list/data/models/product.dart';
import 'package:dev_fest_product_list/data/services/i_product_service.dart';
import 'package:dev_fest_product_list/domain/failures/failure.dart';
import 'package:dev_fest_product_list/utils/firebase_error_messages.dart';

class FirebaseServiceImpl extends IFirebaseService {
  final db = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      final snapshot = await db.collection("products").get();

      final produts = snapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();

      return Right(produts);
    } on FirebaseException catch (e) {
      return Left(Failure(message: FirebaseErrorMessages.fromException(e)));
    }
  }

  @override
  Future<Either<Failure, bool>> createProductList(
    List<ProductModel> products,
  ) async {
    if (products.isEmpty) {
      return Left(Failure(message: "Nenhum produto para criar"));
    }

    try {
      final batch = db.batch();

      for (var product in products) {
        final docRef = db.collection('products').doc();
        final productWithId = product.copyWith(id: docRef.id);

        batch.set(docRef, productWithId.toJson());
      }

      await batch.commit();

      return Right(true);
    } on FirebaseException catch (e) {
      return Left(Failure(message: FirebaseErrorMessages.fromException(e)));
    }
  }

  @override
  Future<Either<Failure, bool>> addToFavorites(String productId) async {
    try {
      await db.collection("products").doc(productId).update({
        "isFavorite": true,
      });

      return Right(true);
    } on FirebaseException catch (e) {
      return Left(Failure(message: FirebaseErrorMessages.fromException(e)));
    }
  }

  @override
  Future<Either<Failure, bool>> removeFromFavorites(String productId) async {
    try {
      await db.collection("products").doc(productId).update({
        "isFavorite": false,
      });

      return Right(true);
    } on FirebaseException catch (e) {
      return Left(Failure(message: FirebaseErrorMessages.fromException(e)));
    }
  }

  @override
  Future<Either<Failure, bool>> addBannerImages(
    List<BannerModel> bannerImages,
  ) async {
    if (bannerImages.isEmpty) {
      return Left(Failure(message: "Nenhum banner para criar"));
    }

    try {
      final batch = db.batch();

      for (var bannerImage in bannerImages) {
        final docRef = db.collection('bannerImages').doc();
        final productWithId = bannerImage;

        batch.set(docRef, productWithId.toJson());
      }

      await batch.commit();

      return Right(true);
    } on FirebaseException catch (e) {
      return Left(Failure(message: FirebaseErrorMessages.fromException(e)));
    }
  }

  @override
  Future<Either<Failure, List<BannerModel>>> getBannerImages() async {
    try {
      final snapshot = await db.collection("bannerImages").get();

      final images = snapshot.docs
          .map((doc) => BannerModel.fromJson(doc.data()))
          .toList();

      return Right(images);
    } on FirebaseException catch (e) {
      return Left(Failure(message: FirebaseErrorMessages.fromException(e)));
    }
  }
}
