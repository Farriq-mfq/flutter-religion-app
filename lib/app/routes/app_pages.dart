import 'package:get/get.dart';

import '../modules/alquran/bindings/alquran_binding.dart';
import '../modules/alquran/views/alquran_view.dart';
import '../modules/detailQuran/bindings/detail_quran_binding.dart';
import '../modules/detailQuran/views/detail_quran_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/tasbih/bindings/tasbih_binding.dart';
import '../modules/tasbih/views/tasbih_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.TASBIH,
      page: () => const TasbihView(),
      binding: TasbihBinding(),
    ),
    GetPage(
      name: _Paths.ALQURAN,
      page: () => const AlquranView(),
      binding: AlquranBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_QURAN,
      page: () => const DetailQuranView(),
      binding: DetailQuranBinding(),
    ),
  ];
}
