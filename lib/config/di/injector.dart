import 'package:dev_fest_product_list/data/repository/i_banner_repository.dart';
import 'package:dev_fest_product_list/data/repository/i_product_repository.dart';
import 'package:dev_fest_product_list/data/repository_impl/banner_repository_impl.dart';
import 'package:dev_fest_product_list/data/repository_impl/product_repository_impl.dart';
import 'package:dev_fest_product_list/data/services/firebase_service_impl.dart';
import 'package:dev_fest_product_list/data/services/i_product_service.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupInjector() {
  getIt.registerLazySingleton<IProductRepository>(
    () => ProductRepositoryImpl(firebaseService: getIt.get<IFirebaseService>()),
  );

  getIt.registerLazySingleton<IBannerRepository>(
    () => BannerRepositoryImpl(firebaseService: getIt.get<IFirebaseService>()),
  );

  getIt.registerLazySingleton<IFirebaseService>(() => FirebaseServiceImpl());
}
