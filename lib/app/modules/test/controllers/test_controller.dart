import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class TestController extends GetxController {
  late YoutubePlayerController youtubePlayerController;
  late YoutubePlayerIFrame player;

  @override
  void onInit() {
    super.onInit();
    player = const YoutubePlayerIFrame();
    var urlID = "4zI0zBhkJIY";
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: urlID,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        desktopMode: false,
        privacyEnhanced: true,
        useHybridComposition: true,
      ),
    );
    youtubePlayerController.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      log('Entered Fullscreen');
    };

    youtubePlayerController.onExitFullscreen = () {
      log('Exited Fullscreen');
    };
  }
}
