import 'dart:convert';

import 'package:alquranapp/app/data/alquran_api_provider.dart';
import 'package:alquranapp/models/Surah.dart';
import 'package:get/get.dart';

class AlquranController extends GetxController with StateMixin<List<Surah>> {
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
    change(null, status: RxStatus.loading());
    AlquranApiProvider().getAllSurah().then((result) {
      List<Surah> listSurah = [];
      for (var i in result) {
        listSurah.add(Surah.fromJson(i));
      }
      change(listSurah, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error());
    });
  }
}
