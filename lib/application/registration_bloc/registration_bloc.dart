import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test1/application/registration_bloc/registration_event.dart';
import 'package:machine_test1/application/registration_bloc/registration_state.dart';
import 'package:machine_test1/domain/api/api_functions.dart';
import 'package:machine_test1/domain/models/branch_model.dart';

class RegistrationBloc extends Bloc<RegistrationEvent,RegistrationState>{
  RegistrationBloc():super(RegistrationInitialState()){
    emit(RegistrationLoadingState());
    ValueNotifier<List<BranchModel>> branchList =ValueNotifier([]);

    on<RegistrationLoadEvent>((event, emit)async{
      branchList.value.clear();
      ApiServices api = ApiServices();
      final data = await api.getBranchList();
      Future.forEach(data, (element){
        branchList.value.add(element);
      });
      log(branchList.value.length.toString());
      branchList.notifyListeners();
      emit(RegistrationLoadedState(branchList: branchList));
    });
  }
}