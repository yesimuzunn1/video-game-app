//Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_game_flutter_project/widgets/carousel_slider_widget.dart';
//Styles
import 'package:video_game_flutter_project/styles/styles.text.dart';
//Widgets
import 'package:video_game_flutter_project/widgets/search_bar.dart';
import 'package:video_game_flutter_project/widgets/list_view_of_games.dart';
import 'package:video_game_flutter_project/widgets/bottom_navigation_bar_items.dart';
//Api
import 'package:video_game_flutter_project/server/api/games_api.dart';

class HomePageScreen extends StatefulWidget {
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List videoGamesList;
  List foundGamesList;
  String query = '';
  var isLoaded = false;

  @override
  void initState() {
    getData();
    super.initState();

    setState(() {
      foundGamesList = videoGamesList;
    });
  }

  getData() async {
    videoGamesList = await GamesApi().getGamesList();

    if (videoGamesList != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  onSearch(String searchValue) {
    if (searchValue.isNotEmpty && searchValue.length > 3) {
      setState(() {
        foundGamesList = videoGamesList.where((games) {
          final name = games['name'].toString().toLowerCase();
          final searchLower = searchValue.toLowerCase();
          return name.contains(searchLower);
        }).toList();

        this.query = searchValue;

        return foundGamesList;
      });
    } else if (searchValue.isEmpty) {
      setState(() {
        this.query = searchValue;
        return foundGamesList.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(
          videoGames: foundGamesList,
          onSearch: (value) {
            onSearch(value);
          },
        ),
      ),
      body: (foundGamesList == null || foundGamesList.isEmpty) && (this.query.length > 3)
          ? AlertDialog(
              elevation: 20,
              title: Text(
                "Üzgünüz, aradığınız oyun bulunamadı!",
                style: boldTextStyle(Colors.redAccent),
              ),
            )
          : SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  videoGamesList == null
                      ? Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 200,
                            width: 400,
                            color: Colors.black,
                            child: Center(child: CircularProgressIndicator()),
                          ),
                        )
                      : CarouselSliderWidget(
                          videoGames: videoGamesList,
                        ),
                  Visibility(
                    visible: isLoaded,
                    replacement: Center(
                      child: CircularProgressIndicator(),
                    ),
                    child: ListViewOfGames(
                      videoGames: foundGamesList == null || foundGamesList.isEmpty ? videoGamesList : foundGamesList,
                      isLoaded: isLoaded,
                    ),
                  )
                ],
              ),
            ),
      bottomNavigationBar: BottomNavigationBarItems(homePageButtonOntap: () {}),
    );
  }
}
