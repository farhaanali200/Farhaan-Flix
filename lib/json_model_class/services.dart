import 'package:http/http.dart' as http;
import 'anime.dart';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';

class Services {
  

  static Future<List<Anime>> getAnime(String name) async {
    String url = "https://sdstreams.herokuapp.com/search?search=$name";
    final response = await http.get(Uri.parse(url));
    try{
      if (response.statusCode == 200) {
        final List<Anime> anime = animeFromJson(response.body);
        return anime;
      } else {
        return <Anime>[];
      }
    } catch(e) {
      print(e);
      return <Anime>[];
    }

  }

}

