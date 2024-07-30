import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/src/core/network_client/dio_client.dart';
import 'package:task/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:task/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:task/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:task/src/features/auth/presentation/pages/auth_login_screen.dart';

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
      ],
      child: MaterialApp(
        title: 'Task',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:LoginPage(),
      ),
    );
  }
}

