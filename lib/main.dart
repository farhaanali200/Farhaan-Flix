import 'package:flutter/material.dart';
import 'package:hoho/home_screen.dart';
import 'json_model_class/home_screen.dart';
import 'test.dart';
import 'json_model_class/anime_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HScreen()
    );
  }
}

