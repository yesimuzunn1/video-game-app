//Packages
import 'package:flutter/material.dart';
//Styles
import 'package:video_game_flutter_project/styles/styles.text.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      strutStyle: StrutStyle(fontSize: 20.0),
      cursorHeight: 20.0,
      autofocus: false,
      cursorColor: Colors.grey,
      controller: editingController,
      onChanged: (value) {
        // onSearch(value);
      },
      decoration: InputDecoration(
        hintText: 'Search',
        contentPadding: const EdgeInsets.only(left: 16, right: 20, top: 15),
        hintStyle: mediumTextStyle(
          Colors.redAccent,
        ),
        suffixIcon: IconButton(
            onPressed: () {
              editingController.clear();
            },
            icon: Icon(
              Icons.close,
              color: Colors.redAccent,
            )),
        prefixIcon: IconButton(
          iconSize: 24,
          icon: Icon(Icons.search, color: Colors.redAccent),
          onPressed: () {},
        ),
      ),
    );
  }
}
