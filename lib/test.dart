import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);


  Future getData() async {

    http.Response response = await http.get(Uri.parse('https://sdstreams.herokuapp.com/anime?anime=naruto'));
    if(response.statusCode == 200) {
      var data = response.body;

      print(jsonDecode(data).runtimeType);

    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
        centerTitle: true,
      ),
    );
  }
}
