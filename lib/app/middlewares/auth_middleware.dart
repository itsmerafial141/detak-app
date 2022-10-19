import 'package:detakapp/app/routes/app_pages.dart';
import 'package:detakapp/core/values/keys/storage_service_key.dart';
import 'package:detakapp/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMidleware extends GetMiddleware {
  StorageService storageService = Get.put(StorageService());

  @override
  RouteSettings? redirect(String? route) {
    if (storageService.read(SSKey.userKey) != null) {
      return const RouteSettings(name: Routes.NAVIGASI);
    } else {
      return null;
    }
  }
}
