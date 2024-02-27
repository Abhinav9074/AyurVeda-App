import 'package:flutter/material.dart';
import 'package:machine_test1/domain/models/branch_model.dart';

abstract class RegistrationState{}

class RegistrationInitialState extends RegistrationState{}

class RegistrationLoadedState extends RegistrationState{
  final ValueNotifier<List<BranchModel>> branchList;

  RegistrationLoadedState({required this.branchList});
}

class RegistrationLoadingState extends RegistrationState{}
