import 'dart:convert';

import 'package:alquranapp/app/data/home_provider.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController with StateMixin {
  //TODO: Implement HomeController

  @override
  void onInit() {
    super.onInit();
    findHijriah();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void findHijriah() {
    DateTime now = new DateTime.now();
    var format = new DateFormat("dd-MM-yyyy");
    HomeProvider().getCurrentIslamDate(format.format(now)).then((value) {
      change(json.decode(value)[0], status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error());
    });
  }

  // void findJadwalSholat() {
  //   var now = new DateTime.now();
  //   var format = new DateFormat("yyyy-MM-dd");
  //   var his = new DateFormat("Hm");
  //   var fullFormat = new DateFormat("yyyy-MM-dd H:m:s");
  //   int epochNow = new DateTime(
  //           now.year,
  //           now.month,
  //           now.day,
  //           int.parse(his.format(now).split(":")[0]),
  //           int.parse(his.format(now).split(":")[1]))
  //       .millisecondsSinceEpoch;
  //   HomeProvider().getJadwalSholat(format.format(now)).then((value) {
  //     final filteredMap = Map.from(value['jadwal']['data'])
  //       ..removeWhere((k, v) {
  //         if (k != 'tanggal') {
  //           int epochV = new DateTime(now.year, now.month, now.day,
  //                   int.parse(v.split(":")[0]), int.parse(v.split(":")[1]))
  //               .millisecondsSinceEpoch;
  //           return epochV < epochNow;
  //         } else {
  //           return false;
  //         }
  //       });
  //     print(filteredMap);
  //     // change(value, status: RxStatus.success());
  //   }, onError: (err) {
  //     change(null, status: RxStatus.error());
  //   });
  // }
}
