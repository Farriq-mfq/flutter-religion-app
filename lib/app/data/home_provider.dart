import 'dart:convert';

import 'package:get/get.dart';

class HomeProvider extends GetConnect {
  @override
  void onInit() {
    // httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<dynamic> getCurrentIslamDate(String date) async {
    var response = await get("http://api.flagodna.com/hijriyah/api/${date}");
    if (response.isOk) {
      return response.body;
    } else {
      Future.error(Exception("Terjadi kesalahan"));
    }
  }

  Future<dynamic> getJadwalSholat(String date) async {
    var response = await get(
        "https://api.banghasan.com/sholat/format/json/jadwal/kota/723/tanggal/${date}");
    if (response.isOk) {
      return response.body;
    } else {
      Future.error(Exception("Terjadi kesalahan"));
    }
  }
}
