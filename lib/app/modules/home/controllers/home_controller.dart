import 'dart:convert';

import 'package:alquranapp/app/data/home_provider.dart';
import 'package:alquranapp/models/JadwalSholat.dart';
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
      change(json.decode(value), status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error());
    });
  }

  void findJadwalSholat() {
    var now = new DateTime.now();
    var format = new DateFormat("yyyy-MM-dd");
    var his = new DateFormat("Hm");
    var fullFormat = new DateFormat("yyyy-MM-dd H:m:s");
    print(his.format(now));
    print(new DateTime(now.year, now.month, now.day, 10, 10, 10));
    List<String> listWaktu = [
      'ashar',
      'dhuha',
      'dzuhur',
      'imsak',
      'isya',
      'maghrib',
      'subuh',
      'terbit'
    ];

    // listWaktu.map((e) => print(e == ));
    HomeProvider().getJadwalSholat(format.format(now)).then((value) {
      var listK = [];
      var list = value['jadwal']['data'].forEach((k, v) => k == 'ashar').toList();
      print(list);
      // var list = json.decode(value['jadwal']['data']).map((e)=>JadwalSholat.fromJson(e)).toList();
      // change(value, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error());
    });
  }
}
