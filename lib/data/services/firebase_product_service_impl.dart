import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dev_fest_product_list/data/models/product.dart';
import 'package:dev_fest_product_list/data/services/i_product_service.dart';
import 'package:dev_fest_product_list/domain/failures/failure.dart';
import 'package:dev_fest_product_list/utils/firebase_error_messages.dart';

class FirebaseProductServiceImpl extends IProductService {
  final db = FirebaseFirestore.instance;

  final List<ProductModel> products = [
    ProductModel(
      id: '1',
      name: "Tênis Esportivo Azul e Branco",
      price: 199.99,
      mainImage:
          "https://images.pexels.com/photos/20370415/pexels-photo-20370415/free-photo-of-tenis-esportivo-azul-e-branco-em-fundo-branco.jpeg",
      images: [
        "https://images.pexels.com/photos/20370415/pexels-photo-20370415/free-photo-of-tenis-esportivo-azul-e-branco-em-fundo-branco.jpeg",
        "https://images.pexels.com/photos/20370418/pexels-photo-20370418/free-photo-of-tenis-nike-pegasus-lateral-direita-em-fundo-branco.jpeg",
        "https://images.pexels.com/photos/20370421/pexels-photo-20370421/free-photo-of-tenis-nike-vista-superior-em-fundo-branco.jpeg",
        "https://images.pexels.com/photos/20370424/pexels-photo-20370424/free-photo-of-sola-de-tenis-nike-em-fundo-branco.jpeg",
      ],
      isFavorite: false,
      sizes: [38, 39, 40, 41, 42],
      description: "Tênis desportivo com bom amortecimento e estilo casual.",
      rating: 4.5,
    ),

    ProductModel(
      id: '2',
      name: "Tênis Branco Clean",
      price: 179.99,
      mainImage:
          "https://images.pexels.com/photos/89155/free-white-sneakers-on-white-background-89155.jpeg",
      images: [
        "https://images.pexels.com/photos/89155/free-white-sneakers-on-white-background-89155.jpeg",
        "https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg",
        "https://images.pexels.com/photos/34400923/pexels-photo-34400923.jpeg",
        "https://images.pexels.com/photos/1124466/pexels-photo-1124466.jpeg",
      ],
      isFavorite: false,
      sizes: [38, 39, 40, 41, 42, 43],
      description: "Sneakers brancos minimalistas, versáteis para dia a dia.",
      rating: 4.2,
    ),
  ];

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
  Future<Either<Failure, bool>> createProduct() async {
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
}
