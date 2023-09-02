import 'package:flutter/material.dart';
import 'consts.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: backgroundColor,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.cover)),
          child: Container(
            margin: const EdgeInsets.only(bottom: 150),
            child: Center(
              child: Image.asset("assets/images/logo.png"),
            ),
          ),
        ),
      );
}
