import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dev_fest_product_list/data/models/product.dart';
import 'package:dev_fest_product_list/data/services/i_product_service.dart';
import 'package:dev_fest_product_list/domain/failures/failure.dart';

class FirebaseProductServiceImpl extends IProductService {
  final db = FirebaseFirestore.instance;

  final List<ProductModel> products = [
    ProductModel(
      id: '1',
      name: "Tênis Olympikus Sprint",
      price: 129.99,
      mainImage:
          "https://images.pexels.com/photos/7222309/pexels-photo-7222309.jpeg",
      images: [
        "https://images.pexels.com/photos/7222309/pexels-photo-7222309.jpeg",
        "https://images.pexels.com/photos/7222312/pexels-photo-7222312.jpeg",
        "https://images.pexels.com/photos/7222315/pexels-photo-7222315.jpeg",
        "https://images.pexels.com/photos/7222318/pexels-photo-7222318.jpeg",
      ],
      isFavorite: false,
      sizes: [37, 38, 39, 40, 41, 42, 43],
      description:
          "Leve e respirável, ideal para corridas leves e uso diário. Design moderno com tecnologia brasileira.",
      rating: 4.3,
    ),

    ProductModel(
      id: '2',
      name: "Tênis Mizuno Wave Rider 27",
      price: 219.99,
      mainImage:
          "https://images.pexels.com/photos/8415910/pexels-photo-8415910.jpeg",
      images: [
        "https://images.pexels.com/photos/8415910/pexels-photo-8415910.jpeg",
        "https://images.pexels.com/photos/8415913/pexels-photo-8415913.jpeg",
        "https://images.pexels.com/photos/8415915/pexels-photo-8415915.jpeg",
        "https://images.pexels.com/photos/8415917/pexels-photo-8415917.jpeg",
      ],
      isFavorite: false,
      sizes: [39, 40, 41, 42, 43, 44],
      description:
          "Amortecimento avançado e estabilidade para corredores que buscam desempenho em longas distâncias.",
      rating: 4.8,
    ),

    ProductModel(
      id: '3',
      name: "Tênis Fila Axilus 2 Energized",
      price: 159.99,
      mainImage:
          "https://images.pexels.com/photos/9113153/pexels-photo-9113153.jpeg",
      images: [
        "https://images.pexels.com/photos/9113153/pexels-photo-9113153.jpeg",
        "https://images.pexels.com/photos/9113156/pexels-photo-9113156.jpeg",
        "https://images.pexels.com/photos/9113159/pexels-photo-9113159.jpeg",
        "https://images.pexels.com/photos/9113162/pexels-photo-9113162.jpeg",
      ],
      isFavorite: false,
      sizes: [38, 39, 40, 41, 42, 43],
      description:
          "Conforto e estilo para o dia a dia, com solado flexível e cabedal respirável.",
      rating: 4.2,
    ),

    ProductModel(
      id: '4',
      name: "Tênis Topper Street Max",
      price: 99.99,
      mainImage:
          "https://images.pexels.com/photos/10279832/pexels-photo-10279832.jpeg",
      images: [
        "https://images.pexels.com/photos/10279832/pexels-photo-10279832.jpeg",
        "https://images.pexels.com/photos/10279835/pexels-photo-10279835.jpeg",
        "https://images.pexels.com/photos/10279837/pexels-photo-10279837.jpeg",
        "https://images.pexels.com/photos/10279840/pexels-photo-10279840.jpeg",
      ],
      isFavorite: false,
      sizes: [36, 37, 38, 39, 40, 41, 42],
      description:
          "Estilo retrô com toque moderno. Perfeito para quem busca conforto sem abrir mão da moda casual.",
      rating: 4.0,
    ),

    ProductModel(
      id: '5',
      name: "Tênis Nike Revolution 6",
      price: 149.99,
      mainImage:
          "https://images.pexels.com/photos/11501498/pexels-photo-11501498.jpeg",
      images: [
        "https://images.pexels.com/photos/11501498/pexels-photo-11501498.jpeg",
        "https://images.pexels.com/photos/11501501/pexels-photo-11501501.jpeg",
        "https://images.pexels.com/photos/11501504/pexels-photo-11501504.jpeg",
        "https://images.pexels.com/photos/11501507/pexels-photo-11501507.jpeg",
      ],
      isFavorite: false,
      sizes: [38, 39, 40, 41, 42, 43, 44],
      description:
          "Leveza e amortecimento suave para caminhadas e treinos leves. Design minimalista e versátil.",
      rating: 4.5,
    ),

    ProductModel(
      id: '6',
      name: "Tênis Adidas Duramo SL",
      price: 169.99,
      mainImage:
          "https://images.pexels.com/photos/12088055/pexels-photo-12088055.jpeg",
      images: [
        "https://images.pexels.com/photos/12088055/pexels-photo-12088055.jpeg",
        "https://images.pexels.com/photos/12088058/pexels-photo-12088058.jpeg",
        "https://images.pexels.com/photos/12088061/pexels-photo-12088061.jpeg",
        "https://images.pexels.com/photos/12088064/pexels-photo-12088064.jpeg",
      ],
      isFavorite: false,
      sizes: [38, 39, 40, 41, 42, 43],
      description:
          "Sola macia e cabedal respirável, ideal para quem busca conforto em atividades diárias e esportivas.",
      rating: 4.4,
    ),

    ProductModel(
      id: '7',
      name: "Tênis New Balance Fresh Foam Arishi",
      price: 189.99,
      mainImage:
          "https://images.pexels.com/photos/12572805/pexels-photo-12572805.jpeg",
      images: [
        "https://images.pexels.com/photos/12572805/pexels-photo-12572805.jpeg",
        "https://images.pexels.com/photos/12572808/pexels-photo-12572808.jpeg",
        "https://images.pexels.com/photos/12572811/pexels-photo-12572811.jpeg",
        "https://images.pexels.com/photos/12572814/pexels-photo-12572814.jpeg",
      ],
      isFavorite: false,
      sizes: [37, 38, 39, 40, 41, 42],
      description:
          "Amortecimento Fresh Foam para uma pisada suave e contínua, perfeito para caminhadas longas.",
      rating: 4.7,
    ),

    ProductModel(
      id: '8',
      name: "Tênis Puma Softride Vital",
      price: 179.99,
      mainImage:
          "https://images.pexels.com/photos/13118892/pexels-photo-13118892.jpeg",
      images: [
        "https://images.pexels.com/photos/13118892/pexels-photo-13118892.jpeg",
        "https://images.pexels.com/photos/13118895/pexels-photo-13118895.jpeg",
        "https://images.pexels.com/photos/13118898/pexels-photo-13118898.jpeg",
        "https://images.pexels.com/photos/13118901/pexels-photo-13118901.jpeg",
      ],
      isFavorite: false,
      sizes: [38, 39, 40, 41, 42, 43],
      description:
          "Tecnologia Softride oferece conforto duradouro e estilo moderno para o uso diário ativo.",
      rating: 4.6,
    ),

    ProductModel(
      id: '9',
      name: "Tênis Asics Gel-Contend 8",
      price: 159.99,
      mainImage:
          "https://images.pexels.com/photos/13679305/pexels-photo-13679305.jpeg",
      images: [
        "https://images.pexels.com/photos/13679305/pexels-photo-13679305.jpeg",
        "https://images.pexels.com/photos/13679308/pexels-photo-13679308.jpeg",
        "https://images.pexels.com/photos/13679311/pexels-photo-13679311.jpeg",
        "https://images.pexels.com/photos/13679314/pexels-photo-13679314.jpeg",
      ],
      isFavorite: false,
      sizes: [39, 40, 41, 42, 43, 44],
      description:
          "Excelente custo-benefício com amortecimento Gel na traseira para impacto reduzido em caminhadas.",
      rating: 4.5,
    ),

    ProductModel(
      id: '10',
      name: "Tênis Under Armour Flow Velociti Wind 3",
      price: 249.99,
      mainImage:
          "https://images.pexels.com/photos/14212780/pexels-photo-14212780.jpeg",
      images: [
        "https://images.pexels.com/photos/14212780/pexels-photo-14212780.jpeg",
        "https://images.pexels.com/photos/14212783/pexels-photo-14212783.jpeg",
        "https://images.pexels.com/photos/14212786/pexels-photo-14212786.jpeg",
        "https://images.pexels.com/photos/14212789/pexels-photo-14212789.jpeg",
      ],
      isFavorite: false,
      sizes: [40, 41, 42, 43, 44],
      description:
          "Tênis premium para corredores de performance, com tecnologia Flow que elimina a borracha tradicional na sola.",
      rating: 4.9,
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
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> createProduct() async {
    try {
      final batch = db.batch();

      final productsCollection = db.collection('products');

      for (final product in products) {
        final docRef = productsCollection.doc();

        batch.set(docRef, {
          'id': product.id,
          'name': product.name,
          'price': product.price,
          'mainImage': product.mainImage,
          'images': product.images,
          'isFavorite': product.isFavorite,
          'sizes': product.sizes,
          'description': product.description,
          'rating': product.rating,
        });
      }

      await batch.commit();

      return Right(true);
    } catch (e) {
      return Left(Failure(message: 'Erro ao criar produtos: $e'));
    }
  }
}
