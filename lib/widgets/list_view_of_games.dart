//Packages
import 'package:flutter/material.dart';
//Styles
import 'package:video_game_flutter_project/styles/styles.text.dart';
//Screens
import 'package:video_game_flutter_project/screens/game_detail_screen.dart';

class ListViewOfGames extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: 100,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GameDetailScreen()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  color: Colors.black,
                  child: Center(child: Text('IMG', style: mediumTextStyle(Colors.white))),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name of Game",
                      style: mediumTextStyle(Colors.black87, fontSize: 22.0),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Rating - released",
                      style: mediumTextStyle(Colors.black87, fontSize: 22.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
