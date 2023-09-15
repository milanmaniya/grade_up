import 'package:flutter/material.dart';
import 'package:grade_up/common_model/common_card_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerScreen extends StatefulWidget {
  const YoutubePlayerScreen(
      {super.key, required this.courseIndex, required this.videoIndex});

  final int? courseIndex;
  final int? videoIndex;

  @override
  State<YoutubePlayerScreen> createState() => _YoutubePlayerScreenState();
}

class _YoutubePlayerScreenState extends State<YoutubePlayerScreen> {

   late YoutubePlayerController controller;

  @override
  void initState() {

    super.initState();
  controller= YoutubePlayerController(
      initialVideoId: courseCardList[widget.courseIndex!]
          .videoPlayerList[widget.videoIndex!],
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YoutubePlayer(
        controller: controller,
        showVideoProgressIndicator: true,
        progressColors: const ProgressBarColors(
          playedColor: Colors.blue,
          handleColor: Colors.blue,
        ),
        onReady: () {
          controller.addListener(() {});
        },
      ),
    );
  }
}
