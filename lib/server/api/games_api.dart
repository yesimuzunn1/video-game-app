import 'package:http/http.dart' as http;
import 'dart:convert';

class GamesApi {
  Map mapResponse;
  List videoGamesListResponse;
  Map detailsOfGame;

  Future getGamesList() async {
    var client = http.Client();
    var uri = Uri.parse("https://api.rawg.io/api/games?key=c15808c0d898493d982a05e2e3359f08");
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      mapResponse = json.decode(response.body);
      return videoGamesListResponse = mapResponse['results'];
    }
  }

  Future getDetailsOfGame(String id) async {
    var client = http.Client();
    var uri = Uri.parse("https://api.rawg.io/api/games/$id?key=c15808c0d898493d982a05e2e3359f08");
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      mapResponse = json.decode(response.body);
      return detailsOfGame = mapResponse;
    }
  }
}
