import 'package:flutter/material.dart';
import 'anime_screen.dart';

class HScreen extends StatefulWidget {
  const HScreen({Key? key}) : super(key: key);

  @override
  _HScreenState createState() => _HScreenState();
}

class _HScreenState extends State<HScreen> {
  Widget appBarTitle = new Text("Search....");
  Icon actionIcon = new Icon(Icons.search);


  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    void search(String name) {
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return Screen(animeName: name);
      }));
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.deepPurpleAccent,
        // centerTitle: true,
        title: appBarTitle,
        actions: <Widget>[
          new IconButton(
            icon: actionIcon,
            onPressed:(){
            setState(() {
              if(this.actionIcon.icon == Icons.search){
                this.actionIcon = new Icon(Icons.close);
                this.appBarTitle = new TextField(
                  onSubmitted: (value){
                    search(value);
                  },
                  style: new TextStyle(
                    color: Colors.white,

                  ),
                  decoration: new InputDecoration(
                      prefixIcon: new Icon(Icons.search,color: Colors.white),
                      hintText: "Search...",
                      hintStyle: new TextStyle(color: Colors.white)
                  ),
                );}
              else {
                this.actionIcon = new Icon(Icons.search);
                this.appBarTitle = new Text("Search...");
              }


            });
          } ,),]
    ),


      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.green, Colors.blue, Colors.deepPurpleAccent ])
        ),
      ),
    );
  }
}


