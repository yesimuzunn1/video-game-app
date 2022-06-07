//Packages
import 'package:flutter/material.dart';

class BottomNavigationBarItems extends StatelessWidget {
  final Function homePageButtonOntap;
  final Function favoritesButtonOntap;

  const BottomNavigationBarItems({Key key, this.homePageButtonOntap, this.favoritesButtonOntap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      color: Colors.black87,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              this.homePageButtonOntap();
            },
            child: Icon(
              Icons.home,
              color: Colors.white,
              size: 30,
            ),
          ),
          InkWell(
            onTap: () {
              this.favoritesButtonOntap();
            },
            child: Icon(
              Icons.favorite,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
