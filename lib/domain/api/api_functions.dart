import 'dart:developer';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:machine_test1/domain/common/constants/api_config.dart';
import 'package:machine_test1/domain/common/constants/shared_preferences.dart';
import 'package:machine_test1/domain/models/branch_model.dart';
import 'package:machine_test1/domain/models/patient_model.dart';

class ApiServices {
  //Login Function
  Future<bool> login(String username, String password) async {
    try {
      final val = await http.post(
          Uri.parse(ApiConfig.baseUrl + ApiConfig.login),
          body: {'username': username, 'password': password});
      final allData = await json.decode(val.body);
      log(allData['token']);
      SharedPreferenceFunction()
          .sharedInstance
          .setString('authToken', allData['token']);
      log('shared :: ${SharedPreferenceFunction().sharedInstance.getString('authToken')}');
      return true;
    } catch (e) {
      log('error');
      log(e.toString());
      return false;
    }
  }

  //Get Patient List
  Future<List<dynamic>> getPatientList() async { 
    try {
      final val = await http
          .get(Uri.parse(ApiConfig.baseUrl + ApiConfig.patientList), headers: {
        'Authorization':
            'Bearer ${SharedPreferenceFunction().sharedInstance.getString('authToken')}'
      });
      final allData = await json.decode(val.body);

      return allData['patient'].map((json) => PatientDetails.fromJson(json)).toList();
    } catch (e) {
      log('error');
      log(e.toString());
      throw Exception(e);
    }
  }

  //Get Branch List

  Future<List<dynamic>>getBranchList()async{
    try{
      final value = await http
          .get(Uri.parse(ApiConfig.baseUrl + ApiConfig.branchList), headers: {
        'Authorization':
            'Bearer ${SharedPreferenceFunction().sharedInstance.getString('authToken')}'
      });
      final allData = await json.decode(value.body);
      log(value.body);
      return allData['branches'].map((json)=>BranchModel.fromJson(json)).toList();
    }catch(e){
      log('error $e');
      throw(Exception(e));
    }
  }
}
