import 'package:get_it/get_it.dart';
import 'package:network/network.dart';
import 'package:task/src/core/network_client/dio_client.dart';
import 'package:task/src/features/auth/login/data/repositories/auth_repository_impl.dart';
import 'package:task/src/features/auth/login/domain/repositories/auth_repository.dart';
import 'package:task/src/features/auth/login/domain/usecases/login_usecase.dart';
import 'package:task/src/features/auth/login/presentation/bloc/auth_bloc.dart';
import 'package:task/src/features/auth/logout/data/repositories/logout_repo_impl.dart';
import 'package:task/src/features/auth/logout/domain/repositories/logout_repository.dart';
import 'package:task/src/features/auth/logout/domain/use_cases/logout_use_case.dart';
import 'package:task/src/features/auth/logout/presentation/bloc/logout_bloc.dart';
import 'package:task/src/features/checkout/presentation/bloc/checkout_bloc.dart';
import 'package:task/src/features/products/data/repositories/product_repo_impl.dart';
import 'package:task/src/features/products/domain/repositories/product_repository.dart';
import 'package:task/src/features/products/domain/use_cases/product_usecase.dart';
import 'package:task/src/features/products/presentation/bloc/product_bloc.dart';

// Import your classes here


final GetIt getIt = GetIt.instance;

void setupLocator() {
  // Register Dio client
  getIt.registerLazySingleton<RestClient>(() => dioClient);

  // Register Repositories
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(client: getIt<RestClient>()));
      
  getIt.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(client: getIt<RestClient>()));
  getIt.registerLazySingleton<LogoutRepository>(
      () => LogoutRepoImple(client: getIt<RestClient>()));

  // Register Use Cases
  getIt.registerLazySingleton<LoginUsecase>(
      () => LoginUsecase(authRepository: getIt<AuthRepository>()));
  getIt.registerLazySingleton<ProductUseCase>(
      () => ProductUseCase(productRepository: getIt<ProductRepository>()));
  getIt.registerLazySingleton<LogoutUseCase>(
      () => LogoutUseCase(logoutRepository: getIt<LogoutRepository>()));

  // Register Blocs
  getIt.registerFactory<AuthBloc>(() => AuthBloc(loginUsecase: getIt<LoginUsecase>()));
  getIt.registerFactory<ProductBloc>(
      () => ProductBloc(productUseCase: getIt<ProductUseCase>()));
  getIt.registerFactory<CheckoutBloc>(() => CheckoutBloc());
  getIt
      .registerFactory<LogoutBloc>(() => LogoutBloc(logoutusecase: getIt<LogoutUseCase>()));
}
