import 'dart:developer';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:machine_test1/domain/common/constants/api_config.dart';
import 'package:machine_test1/domain/common/constants/shared_preferences.dart';

class ApiServices {

  //Login Function
  Future<bool> login(String username,String password) async {
    try {
      final val = await http.post(
          Uri.parse(ApiConfig.baseUrl+ApiConfig.login),
          body: {'username': username, 'password': password});
      final allData = await json.decode(val.body);
      log(allData['token']);
      SharedPreferenceFunction().sharedInstance.setString('authToken', allData['token']);
      log('shared :: ${SharedPreferenceFunction().sharedInstance.getString('authToken')}');
      return true;
    } catch (e) {
      log('error');
      log(e.toString());
      return false;
    }
  }
}
