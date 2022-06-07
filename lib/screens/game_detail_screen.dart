//Packages
import 'package:flutter/material.dart';
//Api
import 'package:video_game_flutter_project/server/api/games_api.dart';
//Styles
import 'package:video_game_flutter_project/styles/styles.text.dart';
//Widgets
import 'package:video_game_flutter_project/widgets/bottom_navigation_bar_items.dart';
//Screens
import 'package:video_game_flutter_project/screens/home_page_screen.dart';

class GameDetailScreen extends StatefulWidget {
  final String id;

  const GameDetailScreen({Key key, this.id}) : super(key: key);
  @override
  State<GameDetailScreen> createState() => _GameDetailScreenState();
}

class _GameDetailScreenState extends State<GameDetailScreen> {
  Map detailsOfVideoGame;
  var isLoaded = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    detailsOfVideoGame = await GamesApi().getDetailsOfGame(widget.id);
    if (detailsOfVideoGame != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return detailsOfVideoGame == null
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.black87,
                    automaticallyImplyLeading: false,
                    leading: InkWell(onTap: () => Navigator.of(context).pop(), child: Icon(Icons.arrow_back)),
                    expandedHeight: 200,
                    floating: true,
                    pinned: true,
                    flexibleSpace: Stack(alignment: Alignment.bottomRight, children: [
                      FlexibleSpaceBar(
                        background: Image.network(
                          detailsOfVideoGame['background_image'].toString(),
                          fit: BoxFit.cover,
                        ),
                        collapseMode: CollapseMode.pin,
                      ),
                      Positioned(
                          child: Padding(
                        padding: const EdgeInsets.only(right: 8.0, bottom: 10.0),
                        child: Icon(
                          Icons.thumb_up,
                          size: 32,
                          color: Colors.grey,
                        ),
                      ))
                    ]),
                  ),
                  SliverFillRemaining(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 12.0,
                          ),
                          Text(
                            detailsOfVideoGame['name'].toString(),
                            style: mediumTextStyle(Colors.black87, fontSize: 22.0, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          Text(
                            detailsOfVideoGame['released'].toString(),
                            style: mediumTextStyle(Colors.black87, fontSize: 16.0, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          Text(
                            detailsOfVideoGame['metacritic'].toString(),
                            style: mediumTextStyle(Colors.black87, fontSize: 16.0, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          Expanded(
                            child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  detailsOfVideoGame['description'].toString(),
                                  style: mediumTextStyle(Colors.black87, fontSize: 16.0, fontWeight: FontWeight.w400),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBarItems(homePageButtonOntap: () {
              Navigator.of(context).pop();
            }),
          );
  }
}
