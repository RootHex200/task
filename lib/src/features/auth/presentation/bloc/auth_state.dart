import 'package:equatable/equatable.dart';
import 'package:task/src/features/auth/data/model/user_model.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoaded extends AuthState {
  final UserModel user;

  AuthLoaded({required this.user});

  @override
  List<Object?> get props => [user];
}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});

  @override
  List<Object?> get props => [message];
}
