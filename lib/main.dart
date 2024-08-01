import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/src/core/network_client/dio_client.dart';
import 'package:task/src/features/auth/login/data/repositories/auth_repository_impl.dart';
import 'package:task/src/features/auth/login/domain/usecases/login_usecase.dart';
import 'package:task/src/features/auth/login/presentation/bloc/auth_bloc.dart';
import 'package:task/src/features/auth/login/presentation/pages/auth_login_screen.dart';
import 'package:task/src/features/auth/logout/data/repositories/logout_repo_impl.dart';
import 'package:task/src/features/auth/logout/domain/use_cases/logout_use_case.dart';
import 'package:task/src/features/auth/logout/presentation/bloc/logout_bloc.dart';
import 'package:task/src/features/checkout/presentation/bloc/checkout_bloc.dart';
import 'package:task/src/features/products/data/repositories/product_repo_impl.dart';
import 'package:task/src/features/products/domain/use_cases/product_usecase.dart';
import 'package:task/src/features/products/presentation/bloc/product_bloc.dart';
import 'package:task/src/utils/colors/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>AuthBloc(loginUsecase: LoginUsecase(authRepository: AuthRepositoryImpl(client: dioClient)))),
        BlocProvider(
          create: (context) => ProductBloc(productUseCase: ProductUseCase(productRepository: ProductRepositoryImpl(client: dioClient))),
        ),
        BlocProvider(create: (context)=>CheckoutBloc()),
        BlocProvider(create: (context)=>LogoutBloc(logoutusecase: LogoutUseCase(logoutRepository: LogoutRepoImple(client: dioClient))))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor:AppColors.primaryAppRedColor),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}

