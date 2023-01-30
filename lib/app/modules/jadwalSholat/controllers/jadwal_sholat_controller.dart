import 'package:alquranapp/app/data/data_provider.dart';
import 'package:alquranapp/models/JadwalSholat.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class JadwalSholatController extends GetxController
    with StateMixin<JadwalSholat> {
  //TODO: Implement JadwalSholatController

  @override
  void onInit() {
    super.onInit();
    findJadwalSholat();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> findJadwalSholat() async {
    var now = new DateTime.now();
    var format = new DateFormat("yyyy-MM-dd");
    change(null, status: RxStatus.loading());
    DataProvider().getJadwalSholat(format.format(now)).then((value) {
      print(value['jadwal']['data']);
      change(JadwalSholat.fromJson(value['jadwal']['data']),
          status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error());
    });
  }
}
