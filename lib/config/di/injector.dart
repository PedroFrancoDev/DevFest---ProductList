import 'package:dev_fest_product_list/data/repository/i_product_repository.dart';
import 'package:dev_fest_product_list/data/repository_impl/product_repository_impl.dart';
import 'package:dev_fest_product_list/data/services/fake_product_service.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupInjector() {
  getIt.registerLazySingleton<IProductRepository>(
    () => ProductRepositoryImpl(productService: getIt.get<FakeProductService>()),
  );

  getIt.registerLazySingleton<FakeProductService>(() => FakeProductService());
}
