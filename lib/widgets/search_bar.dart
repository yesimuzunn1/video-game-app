//Packages
import 'package:flutter/material.dart';
//Styles
import 'package:video_game_flutter_project/styles/styles.text.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.redAccent,
      decoration: InputDecoration(
        focusColor: Colors.redAccent,
        hintStyle: mediumTextStyle(Colors.redAccent, fontSize: 22.0),
        hintText: 'Search',
        suffixIcon: Icon(
          Icons.search,
          color: Colors.redAccent,
        ),
      ),
    );
  }
}
