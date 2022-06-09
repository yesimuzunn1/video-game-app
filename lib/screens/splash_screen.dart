//Packages
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
//Screens
import 'package:video_game_flutter_project/screens/home_page_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.black87,
      splashTransition: SplashTransition.fadeTransition,
      duration: 3000,
      splash: Center(
          child: Image.network(
        'https://cdn-icons-png.flaticon.com/512/742/742263.png',
      )),
      nextScreen: HomePageScreen(),
    );
  }
}
