import 'dart:convert';

import 'package:alquranapp/app/data/alquran_api_provider.dart';
import 'package:alquranapp/models/surah.dart';
import 'package:get/get.dart';

class AlquranController extends GetxController with StateMixin<List<dynamic>> {
  // final loading

  @override
  void onInit() {
    super.onInit();
    findAllSurah();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> findAllSurah() async {
    AlquranApiProvider().getAllSurah().then((result) {
      change(result, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error());
    });
  }

}
