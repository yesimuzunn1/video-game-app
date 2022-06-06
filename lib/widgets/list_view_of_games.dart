//Packages
import 'package:flutter/material.dart';
//Styles
import 'package:video_game_flutter_project/styles/styles.text.dart';
//Screens
import 'package:video_game_flutter_project/screens/game_detail_screen.dart';
//Api
import 'package:video_game_flutter_project/server/api/games_api.dart';

class ListViewOfGames extends StatefulWidget {
  final int itemCount;
  final String name;

  const ListViewOfGames({Key key, this.itemCount, this.name}) : super(key: key);

  @override
  _ListViewOfGamesState createState() => _ListViewOfGamesState();
}

// List videoGamesList;

class _ListViewOfGamesState extends State<ListViewOfGames> {
  List videoGamesList;
  var isLoaded = false;

  @override
  void initState() {
    getData();

    super.initState();
  }

  getData() async {
    videoGamesList = await GamesApi().getGamesList();
    if (videoGamesList != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoaded,
      replacement: Center(
        child: CircularProgressIndicator(),
      ),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: videoGamesList?.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GameDetailScreen(
                          id: videoGamesList[index]['id'].toString(),
                        )),
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
                        videoGamesList[index]['background_image'],
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        videoGamesList[index]['name'],
                        style: mediumTextStyle(Colors.black87, fontSize: 22.0),
                      ),
                      SizedBox(height: 4),
                      Text(
                        videoGamesList[index]['rating'].toString() + videoGamesList[index]['released'].toString(),
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
