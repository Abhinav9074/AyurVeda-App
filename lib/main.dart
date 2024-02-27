import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test1/application/home_bloc/home_bloc.dart';
import 'package:machine_test1/application/login_bloc/login_bloc.dart';
import 'package:machine_test1/application/splash_bloc/splash_bloc.dart';
import 'package:machine_test1/domain/common/constants/shared_preferences.dart';
import 'package:machine_test1/presentation/core/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceFunction().createSharedInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>SplashBloc()),
          BlocProvider(create: (context)=>LoginBloc()),
          ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/splash',
          routes: routes,
        ));
  }
}
