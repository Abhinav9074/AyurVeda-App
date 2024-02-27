import 'package:flutter/material.dart';
import 'package:machine_test1/domain/api/api_functions.dart';
import 'package:machine_test1/presentation/screen/splash/screens/splash_screen.dart';

void main()async{
  // ApiServices sev  = ApiServices();
  //   await sev.login();
runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}