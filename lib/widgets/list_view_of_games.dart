//Packages
import 'package:flutter/material.dart';
//Styles
import 'package:video_game_flutter_project/styles/styles.text.dart';
//Screens
import 'package:video_game_flutter_project/screens/game_detail_screen.dart';

class ListViewOfGames extends StatefulWidget {
  final List videoGames;
  final bool isLoaded;

  const ListViewOfGames({Key key, this.videoGames, this.isLoaded}) : super(key: key);

  @override
  _ListViewOfGamesState createState() => _ListViewOfGamesState();
}

class _ListViewOfGamesState extends State<ListViewOfGames> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isLoaded,
      replacement: Center(
        child: CircularProgressIndicator(),
      ),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.videoGames?.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GameDetailScreen(
                    id: widget.videoGames[index]['id'].toString(),
                  ),
                ),
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
                    child: Center(
                      child: Image.network(
                        widget.videoGames[index]['background_image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.videoGames[index]['name'],
                        style: mediumTextStyle(Colors.black87, fontSize: 22.0),
                      ),
                      SizedBox(height: 4),
                      Text(
                        widget.videoGames[index]['rating'].toString() + " - " + widget.videoGames[index]['released'].toString(),
                        style: mediumTextStyle(Colors.black87, fontSize: 22.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
