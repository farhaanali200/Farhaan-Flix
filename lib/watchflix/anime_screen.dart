import 'package:flutter/material.dart';
import 'services.dart';
import 'anime.dart';
import 'episodes.dart';

class Screen extends StatefulWidget {
  final String? animeName;

  Screen({this.animeName});

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {

  var _anime;
  bool _loading = false;
  Services services = Services();

  @override
  void initState() {
    super.initState();
    _loading = false;
    // Services.getAnime(widget.animeName!).then((anime) {
    //   setState(() {
    //     _anime = anime;
    //     _loading = true;
    //   });
    // });

    err();

  }

  Future err() async{
    try{
      final serv = await services.getAnime(widget.animeName!);
      setState(() {
        _anime = serv;
        _loading = true;
      });
    } catch(e) {
      print(e);
    }

  }

  @override
  Widget build(BuildContext context) {

    final Shader linearGradient = LinearGradient(
      colors: <Color>[Colors.red, Colors.pink, Colors.purple, Colors.deepPurple, Colors.deepPurple, Colors.indigo, Colors.blue, Colors.lightBlue, Colors.cyan,
        Colors.teal,
        Colors.green,
        Colors.lightGreen,
        Colors.lime,
        Colors.yellow,
        Colors.amber,
        Colors.orange,
        Colors.deepOrange,],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
    TextEditingController textEditingController = TextEditingController();


    return Scaffold(
      // appBar: AppBar(
      //     actions: <Widget>[
      //        TextField(
      //          controller: textEditingController,
      //          decoration: InputDecoration(
      //            // icon: Icon(Icons.search),
      //            hintText: "Type Anime...",
      //          ),
      //        )
      //     ]
      // ),
      body: _loading? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio:  0.6
                    //   MediaQuery.of(context).size.width /
                  //       (MediaQuery.of(context).size.height / 4),
                  ),
                  shrinkWrap: true,
                  itemCount:  _anime!.length,
                  itemBuilder: (context, index) {
                    Anime anime = _anime![index];
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Episodes(link: anime.link!, animeName: widget.animeName);
                        }
                        ));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Stack(
                              children: [
                                Image.network(anime.img!, fit: BoxFit.fitHeight),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: Container(
                                    height: 60,
                                    width: 186,
                                    color: Colors.black,
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text(anime.title!, style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white
                                        // foreground: Paint()..shader = linearGradient
                                    )),
                                      ),),
                                  ),
                                )
                        ]
                          ),
                        ),
                      ),
                    );
                  }
              ) : Center(child: CircularProgressIndicator(color: Colors.green))
          ,
    );
  }
}

