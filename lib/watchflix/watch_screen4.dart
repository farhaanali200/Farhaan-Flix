import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class BetterVersion extends StatefulWidget {
  final String? link;
  const BetterVersion({Key? key, this.link}) : super(key: key);

  @override
  _BetterVersionState createState() => _BetterVersionState();
}

class _BetterVersionState extends State<BetterVersion> {
  BetterPlayerController? _betterPlayerController;
  GlobalKey _betterPlayerKey = GlobalKey();

  @override
  void initState() {
    BetterPlayerConfiguration betterPlayerConfiguration = BetterPlayerConfiguration(
      autoPlay: true,
        aspectRatio: 16/9,
        fit: BoxFit.cover
    );
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        // "https://storage.googleapis.com/blissful-mile-315400/LTDJ2RBQ6WWM/22a_1624141693_25056.mp4"
        widget.link!
    );
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController!.setupDataSource(dataSource);
    _betterPlayerController!.setBetterPlayerGlobalKey(_betterPlayerKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.link);
    return Scaffold(
      body: AspectRatio(
        aspectRatio: 16/9,
        child: BetterPlayer(
          key: _betterPlayerKey,
          controller: _betterPlayerController!,
        ),
      ),
    );
  }
}
