import 'dart:convert';

import 'package:alquranapp/app/data/data_provider.dart';
import 'package:alquranapp/models/DoaModel.dart';
import 'package:get/get.dart';

class DoaController extends GetxController with StateMixin<List<DoaModel>> {
  //TODO: Implement DoaController

  @override
  void onInit() {
    super.onInit();
    findDoa();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> findDoa() async {
    change(null, status: RxStatus.loading());
    DataProvider().getAllDoa().then((response) {
      List<DoaModel> listDoa = [];
      for (var i in response.body) {
        listDoa.add(DoaModel.fromJson(i));
      }
      change(listDoa, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error());
    });
  }
}
