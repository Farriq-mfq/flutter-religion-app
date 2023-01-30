import 'package:get/get.dart';

import '../modules/AsmaulHusna/bindings/asmaul_husna_binding.dart';
import '../modules/AsmaulHusna/views/asmaul_husna_view.dart';
import '../modules/alquran/bindings/alquran_binding.dart';
import '../modules/alquran/views/alquran_view.dart';
import '../modules/bacaan/bindings/bacaan_binding.dart';
import '../modules/bacaan/views/bacaan_view.dart';
import '../modules/detailQuran/bindings/detail_quran_binding.dart';
import '../modules/detailQuran/views/detail_quran_view.dart';
import '../modules/doa/bindings/doa_binding.dart';
import '../modules/doa/views/doa_view.dart';
import '../modules/doaSholat/bindings/doa_sholat_binding.dart';
import '../modules/doaSholat/views/doa_sholat_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/jadwalSholat/bindings/jadwal_sholat_binding.dart';
import '../modules/jadwalSholat/views/jadwal_sholat_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/niatSholat/bindings/niat_sholat_binding.dart';
import '../modules/niatSholat/views/niat_sholat_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/tahlil/bindings/tahlil_binding.dart';
import '../modules/tahlil/views/tahlil_view.dart';
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
    GetPage(
      name: _Paths.TAHLIL,
      page: () => const TahlilView(),
      binding: TahlilBinding(),
    ),
    GetPage(
      name: _Paths.ASMAUL_HUSNA,
      page: () => const AsmaulHusnaView(),
      binding: AsmaulHusnaBinding(),
    ),
    GetPage(
      name: _Paths.DOA,
      page: () => const DoaView(),
      binding: DoaBinding(),
    ),
    GetPage(
      name: _Paths.BACAAN,
      page: () => const BacaanView(),
      binding: BacaanBinding(),
    ),
    GetPage(
      name: _Paths.DOA_SHOLAT,
      page: () => const DoaSholatView(),
      binding: DoaSholatBinding(),
    ),
    GetPage(
      name: _Paths.NIAT_SHOLAT,
      page: () => const NiatSholatView(),
      binding: NiatSholatBinding(),
    ),
    GetPage(
      name: _Paths.JADWAL_SHOLAT,
      page: () => const JadwalSholatView(),
      binding: JadwalSholatBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
  ];
}
