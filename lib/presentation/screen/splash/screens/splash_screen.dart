import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset('assets/images/background.png',fit: BoxFit.cover,)),
         Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Image.asset('assets/images/logo.png'),
          ),
        )
      ],
    );
  }
}
