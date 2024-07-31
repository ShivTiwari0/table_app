import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:table_app/my_homepage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Center(
          child: Lottie.asset(
              'assets/animated/Animation - 1722443838741.json', fit: BoxFit.fitHeight),
        ),
        nextScreen:const MyHomepage(),
        
        ); 
  }
}
