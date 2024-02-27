import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test1/application/home_bloc/home_event.dart';
import 'package:machine_test1/application/home_bloc/home_state.dart';
import 'package:machine_test1/domain/api/api_functions.dart';
import 'package:machine_test1/domain/models/patient_model.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  HomeBloc() : super(HomeInitialState()){
    emit(HomeLoadingState());

    ValueNotifier<List<PatientDetails>> patientList =ValueNotifier([]);

    on<HomeRefreshEvent>((event, emit)async{
      emit(HomeRefreshLoadingState());
      patientList.value.clear();
      ApiServices api = ApiServices();
      final data = await api.getPatientList();
      Future.forEach(data, (element){
        patientList.value.add(element);
      });
      log(patientList.value.length.toString());
      patientList.notifyListeners();
      emit(HomeLoadedState(patientList: patientList));
    });
  }
}