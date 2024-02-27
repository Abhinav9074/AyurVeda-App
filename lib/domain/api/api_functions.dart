// import 'dart:developer';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class ApiServices {
//   Future<void> login() async {
//     try {
//       final val = await http.post(
//           Uri.parse('https://flutter-amr.noviindus.in/api/Login'),
//           body: {'username': 'test_user', 'password': '12345678'});

//       log('${val.body}');
//       final allData = await json.decode(val.body);
//       log('token is ');
//       log(allData['token']);

// final list = await http.get(
//   Uri.parse('https://flutter-amr.noviindus.in/api/PatientList'),
//   headers: {
//     'Authorization':'Bearer ${allData['token']}'
//   }
// );


//       log(list.body);
//     } catch (e) {
//       log('error');
//       log(e.toString());
//     }
//   }
// }
