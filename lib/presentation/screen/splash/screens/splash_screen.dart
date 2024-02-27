import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test1/application/splash_bloc/splash_bloc.dart';
import 'package:machine_test1/application/splash_bloc/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if(state is SplashLoadedState){
          Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
        }
      },
      child: SafeArea(
        child: Stack(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  'assets/images/background.png',
                  fit: BoxFit.cover,
                )),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Image.asset('assets/images/logo.png'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
