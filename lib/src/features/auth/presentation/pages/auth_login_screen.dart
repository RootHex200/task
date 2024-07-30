

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:task/src/features/auth/presentation/bloc/auth_event.dart';
import 'package:task/src/features/auth/presentation/bloc/auth_state.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is AuthLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Welcome, ${state.user.data!.name!}')),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const CircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(LoginEvent(
                        email: emailController.text,
                        password: passwordController.text,
                      ));
                    },
                    child: const Text('Login'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
