import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/src/core/service/service_locator.dart';
import 'package:task/src/features/auth/login/presentation/bloc/auth_bloc.dart';
import 'package:task/src/features/auth/login/presentation/pages/auth_login_screen.dart';
import 'package:task/src/features/auth/logout/presentation/bloc/logout_bloc.dart';
import 'package:task/src/features/checkout/presentation/bloc/checkout_bloc.dart';
import 'package:task/src/features/products/presentation/bloc/product_bloc.dart';
import 'package:task/src/utils/colors/app_colors.dart';

void main() {
    setupLocator(); // Initialize GetIt service locator

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AuthBloc>()),
        BlocProvider(create: (context) => getIt<ProductBloc>()),
        BlocProvider(create: (context) => getIt<CheckoutBloc>()),
        BlocProvider(create: (context) => getIt<LogoutBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: AppColors.primaryAppRedColor),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
