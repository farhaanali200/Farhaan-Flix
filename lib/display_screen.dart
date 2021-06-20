import 'package:flutter/material.dart';

class DisplayScreen extends StatefulWidget {

  final animeData;
  DisplayScreen({this.animeData});

  @override
  _DisplayScreenState createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {

  var name;

  @override
  void initState() {
    super.initState();
    updateUI(widget.animeData);
  }

  void updateUI(dynamic animeData){

    name = animeData[0]['title'];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.count(
            crossAxisCount: 2,
          children: [
            Card(
              child: Stack(
                children: [
                  Center(child: Text("Hello", style: TextStyle(color: Colors.lightBlue, fontSize: 40),)),
                  Positioned(
                      bottom: 0,
                      left: 120,
                      child: Text(name!, style: TextStyle(color: Colors.green),))
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
