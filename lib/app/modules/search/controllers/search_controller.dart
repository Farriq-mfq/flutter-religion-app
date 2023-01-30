import 'package:alquranapp/app/data/alquran_api_provider.dart';
import 'package:alquranapp/models/Surah.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchController extends GetxController with StateMixin<List<Surah>> {
  //TODO: Implement SearchController

  @override
  void onInit() {
    super.onInit();
    getSearch("");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getSearch(String search) async {
    change(null, status: RxStatus.loading());
    AlquranApiProvider().getAllSurah().then((result) {
      List<Surah> listSurah = [];
      for (var i in result) {
        listSurah.add(Surah.fromJson(i));
      }

      List<Surah> filteList = listSurah
          .where(
            (element) =>
                element.name!.translation!.id!.toLowerCase().contains(search),
          )
          .toList();
      if (search.isNotEmpty) {
        change(filteList, status: RxStatus.success());
      } else {
        change([], status: RxStatus.success());
      }
    }, onError: (err) {
      change(null, status: RxStatus.error());
    });
  }
}
