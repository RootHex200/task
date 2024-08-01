

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:task/src/features/auth/presentation/bloc/auth_event.dart';
import 'package:task/src/features/auth/presentation/bloc/auth_state.dart';
import 'package:task/src/utils/constant/constant.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUsecase;
  AuthBloc({required this.loginUsecase}) : super(AuthInitial()) {
    on<LoginEvent>((event, emit)async {
      emit(AuthLoading());
      final result=await loginUsecase.login(event.email, event.password);
      result.fold((error)=>emit(AuthError(message: error.message!)), (data)async {
          emit(AuthLoaded(user: data));
          final SharedPreferences prefs = await shared_preferences;
          await prefs.setString("token", data.token!);
      });
    });
  }
}