import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class WatchScreen extends StatefulWidget {
  final String? episodeLink;

  WatchScreen({this.episodeLink});

  @override
  _WatchScreenState createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  ChewieController? _chewieController;


  @override
  void initState() {
    super.initState();
    print("Yeh init state hai");
    print(widget.episodeLink!);
    // Future.delayed(Duration(seconds: 5));
    _chewieController = ChewieController(
      videoPlayerController: VideoPlayerController.network(widget.episodeLink!),
      aspectRatio: 16 / 9,
      autoInitialize: true,
      autoPlay: true,
      looping: true,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              errorMessage,
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
      print("Ye jo hai so watch screen ki link hai ${widget.episodeLink}");
      return Chewie(
        controller: _chewieController!,
      );
  }

  @override
  void dispose() {
    _chewieController!.videoPlayerController.dispose();
    _chewieController!.dispose();
    super.dispose();
  }


  }
