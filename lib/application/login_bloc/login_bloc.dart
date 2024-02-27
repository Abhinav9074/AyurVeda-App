

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test1/application/login_bloc/login_event.dart';
import 'package:machine_test1/application/login_bloc/login_state.dart';
import 'package:machine_test1/domain/api/api_functions.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoggedInEvent>((event, emit) async {
      emit(LoginLoadingState());
      ApiServices api = ApiServices();
      if(await api.login(event.email, event.password)){
        emit(LoginSuccessState());
      }else{
        emit(LoginFailedState());
      }

    });

 


  }
}
