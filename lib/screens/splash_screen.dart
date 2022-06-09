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
      backgroundColor: Colors.blueAccent.withOpacity(0.5),
      splashTransition: SplashTransition.fadeTransition,
      duration: 3000,
      splash: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            'https://cdn-icons-png.flaticon.com/512/5260/5260498.png',
            width: 70,
            height: 70,
          ),
        ],
      )),
      nextScreen: HomePageScreen(),
    );
  }
}
