import 'dart:convert';

import 'package:alquranapp/models/Surah.dart';
import 'package:get/get.dart';

class AlquranApiProvider extends GetConnect {
  @override
  void onInit() {
    // httpClient.defaultDecoder = Surah.listFromJson;
    // httpClient.baseUrl = "https://api.quran.gading.dev";
  }

  Future<dynamic> getAllSurah() async {
    final Response response = await get("https://api.quran.gading.dev/surah");
    if (response.isOk) {
      return response.body['data'];
    } else {
      return Future.error(Exception("Somthing error"));
    }
  }
  Future<dynamic> getDetailSurah(String id) async {
    final Response response = await get("https://api.quran.gading.dev/surah/${id}");
    if (response.isOk) {
      return response.body['data'];
    } else {
      return Future.error(Exception("Somthing error"));
    }
  }
}
