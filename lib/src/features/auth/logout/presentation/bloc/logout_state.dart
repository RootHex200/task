


import 'package:equatable/equatable.dart';

abstract class LogoutState extends Equatable{

  @override
  List<Object?> get props => [];
}

class LogoutInitial extends LogoutState{}

class LougutSuccessState extends LogoutState{
  final String? data;
  LougutSuccessState({this.data});
  @override
  List<Object?> get props => [data];
}
class LogoutErrorState extends LogoutState{
  final String? data;
  LogoutErrorState({this.data});

  @override
  List<Object?> get props => [data];
}