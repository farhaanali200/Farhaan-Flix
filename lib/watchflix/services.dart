import 'package:http/http.dart' as http;
import 'anime.dart';

class Services {


   Future getAnime(String name) async {
    String url = "https://sdstreams.herokuapp.com/search?search=$name";
    final response = await http.get(Uri.parse(url));
    try{
      if (response.statusCode == 200) {
        final anime = animeFromJson(response.body);
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

