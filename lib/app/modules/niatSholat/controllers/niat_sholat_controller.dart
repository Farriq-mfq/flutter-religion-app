import 'package:alquranapp/app/data/data_provider.dart';
import 'package:alquranapp/models/NiatSholatModel.dart';
import 'package:get/get.dart';

class NiatSholatController extends GetxController
    with StateMixin<List<NiatSholatModel>> {
  //TODO: Implement NiatSholatController

  @override
  void onInit() {
    super.onInit();
    findNiatSholat();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void findNiatSholat() {
    DataProvider().getNiatSholat().then((value) {
      List<NiatSholatModel> listNiat = [];
      for (var i in value) {
        listNiat.add(NiatSholatModel.fromJson(i));
      }
      Future.delayed(Duration(milliseconds: 500), () {
        change(listNiat, status: RxStatus.success());
      });
    }, onError: (err) {
      change(null, status: RxStatus.error());
    });
  }
}
