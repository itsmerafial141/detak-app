import 'package:detakapp/app/modules/profile/bindings/daftar_riwayat_binding.dart';
import 'package:detakapp/app/modules/profile/bindings/hasil_test_binding.dart';
import 'package:detakapp/app/modules/profile/views/daftar_riwayat_view.dart';
import 'package:get/get.dart';

import '../modules/daftar/bindings/daftar_binding.dart';
import '../modules/daftar/views/daftar_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/kusioner/bindings/kusioner_binding.dart';
import '../modules/kusioner/views/kusioner_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/navigasi/bindings/navigasi_binding.dart';
import '../modules/navigasi/views/navigasi_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/hasil_test_view.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/test/bindings/test_binding.dart';
import '../modules/test/views/test_view.dart';
import '../modules/video/bindings/video_binding.dart';
import '../modules/video/views/video_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const HP = Routes.HOME;
  static const DF = Routes.DAFTAR;
  static const LG = Routes.LOGIN;
  static const NV = Routes.NAVIGASI;
  static const PR = Routes.PROFILE;
  static const TS = Routes.TEST;
  static const VD = Routes.VIDEO;
  static const KS = Routes.KUSIONER;
  static const HT = Routes.HASIL_TEST;
  static const DR = Routes.DAFTAR_RIWAYAT;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DAFTAR,
      page: () => const DaftarView(),
      binding: DaftarBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.NAVIGASI,
      page: () => const NavigasiView(),
      binding: NavigasiBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.TEST,
      page: () => TestView(),
      binding: TestBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO,
      page: () => const VideoView(),
      binding: VideoBinding(),
    ),
    GetPage(
      name: _Paths.KUSIONER,
      page: () => const KusionerView(),
      binding: KusionerBinding(),
    ),
    GetPage(
      name: _Paths.HASIL_TEST,
      page: () => const HasilTestView(),
      binding: HasilTestBinding(),
    ),
    GetPage(
      name: _Paths.DAFTAR_RIWAYAT,
      page: () => const DaftarRiwayatView(),
      binding: DaftarRiwayatBinding(),
    ),
  ];
}
