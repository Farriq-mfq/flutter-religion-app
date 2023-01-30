import 'dart:convert';

import 'package:alquranapp/models/TahlilModel.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DataProvider extends GetConnect {
  @override
  void onInit() {
    // httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<List> getAllDoaTahlil() async {
    final String response =
        await rootBundle.loadString("assets/data/tahlil.json");
    final data = await json.decode(response);
    return data['data'];
  }

  Future<List> getAllAsmaulHusna() async {
    final String response =
        await rootBundle.loadString("assets/data/asmaul-husna.json");
    final data = await json.decode(response);
    return data;
  }

  Future<Response<dynamic>> getAllDoa() async {
    final Response response =
        await get("https://doa-doa-api-ahmadramadhan.fly.dev/api");
    if (response.isOk) {
      return response;
    } else {
      return Future.error(Exception("Terjadi Kesalahan"));
    }
  }

  Future<List> getBacaanSholat() async {
    final String response =
        await rootBundle.loadString("assets/data/bacaanshalat.json");
    final data = await json.decode(response);
    return data;
  }

  Future<List> getNiatSholat() async {
    final String response =
        await rootBundle.loadString("assets/data/niatshalat.json");
    final data = await json.decode(response);
    return data;
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
