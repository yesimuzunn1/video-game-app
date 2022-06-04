//Packages
import 'package:flutter/material.dart';
import 'dart:convert';
//Styles
import 'package:video_game_flutter_project/styles/styles.text.dart';
//Screens
import 'package:video_game_flutter_project/screens/game_detail_screen.dart';

//Api
import 'package:http/http.dart' as http;

class ListViewOfGames extends StatefulWidget {
  final int itemCount;
  final String name;

  const ListViewOfGames({Key key, this.itemCount, this.name}) : super(key: key);

  @override
  _ListViewOfGamesState createState() => _ListViewOfGamesState();
}

Map mapResponse;
List videoGamesListResponse;

class _ListViewOfGamesState extends State<ListViewOfGames> {
  Future apiCall() async {
    http.Response response;
    response = await http.get(Uri.parse("https://api.rawg.io/api/games?key=c15808c0d898493d982a05e2e3359f08"));

    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
        videoGamesListResponse = mapResponse['results'];
      });
    }
  }

  @override
  void initState() {
    apiCall();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: videoGamesListResponse == null ? 0 : videoGamesListResponse.length,
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
                  child: Center(
                    child: Image.network(
                      videoGamesListResponse[index]['background_image'],
                      // fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      videoGamesListResponse[index]['name'],
                      style: mediumTextStyle(Colors.black87, fontSize: 22.0),
                    ),
                    SizedBox(height: 4),
                    Text(
                      videoGamesListResponse[index]['rating'].toString() + videoGamesListResponse[index]['released'].toString(),
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
