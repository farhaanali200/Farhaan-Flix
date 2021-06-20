import 'package:flutter/material.dart';
import 'package:better_player/better_player.dart';
import 'package:video_player/video_player.dart';

class BetterP extends StatelessWidget {
  final episodeLink;

  BetterP({this.episodeLink});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: AspectRatio(
        aspectRatio: 16/9,
        child: BetterPlayer.network(
          episodeLink,
          betterPlayerConfiguration: BetterPlayerConfiguration(
              aspectRatio: 16/9
          ),
        ),
      ),
    );
  }
}