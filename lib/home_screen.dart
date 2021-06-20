import 'package:flutter/material.dart';
import 'package:hoho/fetch_data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'display_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    title();
  }

  void title() async {
    FetchData fetchData = FetchData(url: 'https://sdstreams.herokuapp.com/anime?anime=naruto');
    dynamic data = await fetchData.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return DisplayScreen(animeData: data);
    }));

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Anime Flix"),
        centerTitle: true,
      ),
      body: SpinKitDoubleBounce(
        color: Colors.blue,
        size: 100,
      )
    );
  }
}
