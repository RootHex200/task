

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/src/features/auth/logout/domain/use_cases/logout_use_case.dart';
import 'package:task/src/features/auth/logout/presentation/bloc/logout_event.dart';
import 'package:task/src/features/auth/logout/presentation/bloc/logout_state.dart';
import 'package:task/src/utils/constant/constant.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final LogoutUseCase logoutusecase;
  LogoutBloc({required this.logoutusecase}) : super(LogoutInitial()) {
    on<ClickLogoutEvent>((event, emit)async {
      final result=await logoutusecase.logout();
      result.fold((l) => emit(LogoutErrorState(data: l.message)), (r) async{
        emit(LougutSuccessState(data: r.message));
        //clean token
        final SharedPreferences prefs = await shared_preferences;
        prefs.clear();
      });
    });

    on<LogoutInitialEvent>((event,emit){
      emit(LogoutInitial());
    });
  }
}