import 'dart:developer';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:machine_test1/domain/common/constants/api_config.dart';
import 'package:machine_test1/domain/common/constants/shared_preferences.dart';
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
      log(allData['patient'][0]['name']);
      return allData['patient'].map((json) => PatientDetails.fromJson(json)).toList();
    } catch (e) {
      log('error');
      log(e.toString());
      throw Exception(e);
    }
  }
}
