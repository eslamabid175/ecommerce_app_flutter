import 'package:ecommerce_app/core/networking/dio_helper.dart';
import 'package:ecommerce_app/core/utils/storage_helper.dart';


import 'package:get_it/get_it.dart';

import '../../features/auth/data/repo/auth_repo.dart';
import '../../features/auth/presentation/viewModel/auth_cubit.dart';
import '../../features/cart/data/repo/cart_repo.dart';
import '../../features/cart/presentaion/viewModel/cart_cubit.dart';
import '../../features/home_screen/data/repo/home_repo.dart';
import '../../features/home_screen/presentaion/viewModel/categories_cubit.dart';
import '../../features/home_screen/presentaion/viewModel/product_cubit.dart';

GetIt sl = GetIt.instance;

void setupServiceLocator() {
  DioHelper dio = DioHelper();

  // Dio Helper
  sl.registerSingleton<DioHelper>(dio);

  //Storage Helper

  sl.registerLazySingleton(() => StorageHelper());

  // Repos
  sl.registerLazySingleton(() => AuthRepo(sl<DioHelper>()));
  sl.registerLazySingleton(() => HomeRepo(sl<DioHelper>()));
  sl.registerLazySingleton(() => CartRepo(sl<DioHelper>()));

  // Cubit
  sl.registerFactory(() => AuthCubit(sl<AuthRepo>()));
  sl.registerFactory(() => ProductCubit(sl<HomeRepo>()));
  sl.registerFactory(() => CategoriesCubit(sl<HomeRepo>()));
  sl.registerFactory(() => CartCubit(sl<CartRepo>()));
}
