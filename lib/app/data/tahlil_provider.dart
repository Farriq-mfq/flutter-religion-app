import 'dart:convert';

import 'package:alquranapp/models/TahlilModel.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TahlilProvider extends GetConnect {
  @override
  void onInit() {
    // httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<List> getAllDoaTahlil() async{
    final String response = await rootBundle.loadString("assets/data/tahlil.json");
    final data = await json.decode(response);
    return data['data'];
  }
}
