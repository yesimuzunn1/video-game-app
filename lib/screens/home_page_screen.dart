//Packages
import 'package:flutter/material.dart';
//Styles
import 'package:video_game_flutter_project/styles/styles.text.dart';
//Widgets
import 'package:video_game_flutter_project/widgets/search_bar.dart';
import 'package:video_game_flutter_project/widgets/list_view_of_games.dart';

class HomePageScreen extends StatefulWidget {
  final String title;

  const HomePageScreen({Key key, this.title}) : super(key: key);
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: SearchBar()),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 300,
                width: 400,
                color: Colors.black,
                child: Center(child: Text('IMG', style: mediumTextStyle(Colors.white))),
              ),
            ),
            ListViewOfGames()
          ],
        ),
      ),
    );
  }
}
