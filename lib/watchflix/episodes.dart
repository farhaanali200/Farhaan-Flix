import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hoho/json_model_class/watch_screen4.dart';
import 'package:http/http.dart' as http;

class Episodes extends StatefulWidget {
  final String? link;
  final String? animeName;

  Episodes({this.link, this.animeName});

  @override
  _EpisodesState createState() => _EpisodesState();
}


// void totalEpisodes() {
//
// }


class _EpisodesState extends State<Episodes> {

  // String? epLink;

  bool isLoading = false;


  @override
  void initState() {
    getEpisodeNo();
    super.initState();
  }

  // void epLinkParse() async{
  //   response = await http.get(Uri.parse(epLink!));
  //   print(response!.body);
  //   setState(() {
  //     isLoading = true;
  //   });
  // }

  String? totalEp;

  void getEpisodeNo() async{
    http.Response ep = await http.get(Uri.parse("https://sdstreams.herokuapp.com/anime?anime=${widget.animeName}"));
    String data = ep.body;
    totalEp = jsonDecode(data)[0]['total_episodes'];
    print(totalEp);
    print(totalEp.runtimeType);
    setState(() {
      isLoading = true;
    });
    // setState(() {
    //   isLoading = true;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isLoading? AppBar(
        backgroundColor: Colors.black,
        title: Text("Total Episodes: $totalEp", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ) : null,
      body: isLoading? GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              childAspectRatio: 0.9
          ),
          itemCount: int.parse(totalEp!),
          itemBuilder: (context, index) {
            int ind = index + 1;
            // String name = widget.link!;

            String epLink = "https://sdstreams.herokuapp.com/episode?episode=$index&link=${widget.link!}";

            // epLinkParse();

            return GestureDetector(
              onTap: () async{
                 print(epLink);

              //    RegExp exp = new RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
              //    Iterable<RegExpMatch> matches = exp.allMatches(epLink);
              //
              //    matches.forEach((match) {
              //      print(epLink.substring(match.start, match.end));
              //    });

                 http.Response resp = await http.get(Uri.parse(epLink));
                 print("CODE RED TEST");
                 final respBody = resp.body;
                 final decodedlink = jsonDecode(respBody);

                 // final regex = RegExp(r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)');

                 // final matches = regex.stringMatch(respBody);
                 // final extractedText = matches.toString();
                 // print("REG Ex Testing:");
                 print(respBody);
                 print(respBody.runtimeType);


                 Navigator.push(context, MaterialPageRoute(builder: (context){
                 return BetterVersion(link: decodedlink);
               }));

              },


              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                // color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                color: Colors.greenAccent,
                child: Center(child: Text("$ind", style: TextStyle(color: Colors.white))),
              ),
            );
      }
      ) : Center(child: CircularProgressIndicator(color: Colors.blue,)),
    );
  }
}
