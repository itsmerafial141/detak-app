import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

// import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../../../core/theme/colors.dart';

class TestController extends GetxController {
  // late YoutubePlayerController youtubePlayerController;
  // late YoutubePlayerIFrame player;

  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  var videoPaused = false.obs;

  @override
  void onInit() {
    super.onInit();
    initializeData();

    // player = const YoutubePlayerIFrame();
    // var urlID = "4zI0zBhkJIY";
    // youtubePlayerController = YoutubePlayerController(
    //   initialVideoId: urlID,
    //   params: const YoutubePlayerParams(
    //     showControls: true,
    //     showFullscreenButton: true,
    //     desktopMode: false,
    //     privacyEnhanced: true,
    //     useHybridComposition: true,
    //   ),
    // );
    // youtubePlayerController.onEnterFullscreen = () {
    //   SystemChrome.setPreferredOrientations([
    //     DeviceOrientation.landscapeLeft,
    //     DeviceOrientation.landscapeRight,
    //   ]);
    //   log('Entered Fullscreen');
    // };

    // youtubePlayerController.onExitFullscreen = () {
    //   log('Exited Fullscreen');
    // };
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
    chewieController!.pause();
    chewieController!.seekTo(
      const Duration(milliseconds: 0),
    );
    chewieController!.dispose();
  }

  Future<void> initializeData() async {
    videoPlayerController =
        VideoPlayerController.asset("assets/videos/video.mp4");
    try {
      await Future.wait([videoPlayerController.initialize()]);
    } catch (err) {
      err.toString();
    }
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
      looping: true,
      aspectRatio: 16 / 9,
      materialProgressColors: ChewieProgressColors(
        playedColor: CustomColors.primaryColor,
        handleColor: CustomColors.white,
        backgroundColor: CustomColors.grey50,
        bufferedColor: CustomColors.grey,
      ),
      placeholder: ColoredBox(color: CustomColors.soft),
      autoInitialize: true,
      allowedScreenSleep: false,
    );
    update();
  }
}
