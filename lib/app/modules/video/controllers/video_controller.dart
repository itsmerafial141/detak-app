import 'dart:developer';

import 'package:detakapp/app/data/models/video_model.dart';
import 'package:detakapp/core/values/lists.dart';
import 'package:get/get.dart';

class VideoController extends GetxController {
  late List<VideoModel> listDataVideo;

  @override
  void onInit() {
    super.onInit();
    listDataVideo = [];
    _initialData();
    log(listDataVideo.length.toString());
  }

  @override
  void dispose() {
    super.dispose();
    listDataVideo.clear();
  }

  void _initialData() {
    for (int index = 0; index < CustomList.video.length; index++) {
      var data = CustomList.video[index];
      listDataVideo.add(
        VideoModel(
          id: data['id'].toString(),
          title: data['title'].toString(),
          image: data['image'].toString(),
          content: data['content'].toString(),
          video: data['video'].toString(),
          duration: data['duration'].toString(),
        ),
      );
    }
  }
}
