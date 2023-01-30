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
}
