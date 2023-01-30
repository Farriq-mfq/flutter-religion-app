import 'package:alquranapp/app/data/data_provider.dart';
import 'package:alquranapp/models/DoaSholat.dart';
import 'package:get/get.dart';

class DoaSholatController extends GetxController
    with StateMixin<List<DoaSholat>> {
  //TODO: Implement DoaSholatController

  @override
  void onInit() {
    super.onInit();
    findDoaSholat();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void findDoaSholat() {
    DataProvider().getBacaanSholat().then((value) {
      List<DoaSholat> listDoaSholat = [];
      for (var i in value) {
        listDoaSholat.add(DoaSholat.fromJson(i));
      }
      Future.delayed(Duration(milliseconds: 500), () {
        change(listDoaSholat, status: RxStatus.success());
      });
    }, onError: (err) {
      change(null, status: RxStatus.error());
    });
  }
}
