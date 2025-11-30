import 'package:dev_fest_product_list/data/repository/product_repository.dart';
import 'package:dev_fest_product_list/data/repository_impl/product_repository_impl.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupInjector() {
  getIt.registerLazySingleton<ProductRepository>(() => IProductRepository());
}