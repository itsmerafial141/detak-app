import 'package:get/get.dart';

class BaseService extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = 'https://detak.bgskr-project.my.id';
    httpClient.timeout = const Duration(minutes: 1);
  }
}
