import 'package:flutter/material.dart';
import 'package:machine_test1/domain/models/patient_model.dart';

abstract class HomeState{}

class HomeInitialState extends HomeState{}

class HomeLoadingState extends HomeState{}
class HomeRefreshLoadingState extends HomeState{}

class HomeLoadedState extends HomeState{
  final ValueNotifier<List<PatientDetails>> patientList;

  HomeLoadedState({required this.patientList});

}