//Packages
import 'package:flutter/material.dart';
//Styles
import 'package:video_game_flutter_project/styles/styles.text.dart';

class SearchBar extends StatefulWidget {
  final List videoGames;
  final Function(String value) onSearch;

  const SearchBar({Key key, this.videoGames, this.onSearch}) : super(key: key);
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
        widget.onSearch(value);
      },
      decoration: InputDecoration(
        hintText: 'Search',
        contentPadding: const EdgeInsets.only(left: 16, right: 20, top: 15),
        hintStyle: mediumTextStyle(
          Colors.redAccent,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Icon(
            Icons.search,
            color: Colors.redAccent,
            size: 28,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
      ),
    );
  }
}
