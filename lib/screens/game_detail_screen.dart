import 'package:flutter/material.dart';
//Api
import 'package:video_game_flutter_project/server/api/games_api.dart';

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
                          color: Colors.white,
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
                          Text(detailsOfVideoGame['name'].toString()),
                          SizedBox(
                            height: 12.0,
                          ),
                          Text(detailsOfVideoGame['released'].toString()),
                          SizedBox(
                            height: 12.0,
                          ),
                          Text(detailsOfVideoGame['metacritic'].toString()),
                          SizedBox(
                            height: 12.0,
                          ),
                          Expanded(
                            child: Padding(padding: const EdgeInsets.only(left: 8.0), child: Text(detailsOfVideoGame['description'].toString())),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
