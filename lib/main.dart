import 'package:flutter/material.dart';
import 'package:video_game_flutter_project/screens/home_page_screen.dart';
import 'package:video_game_flutter_project/screens/game_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.white, elevation: 0.0),
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: GameDetailScreen(),
      home: HomePageScreen(title: 'Video Game Home Page'),
    );
  }
}
