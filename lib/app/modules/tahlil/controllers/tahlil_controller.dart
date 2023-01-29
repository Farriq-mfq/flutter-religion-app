import 'package:alquranapp/app/data/tahlil_provider.dart';
import 'package:get/get.dart';

class TahlilController extends GetxController with StateMixin {
  //TODO: Implement TahlilController

  @override
  void onInit() {
    super.onInit();
    findAllTahlil();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void findAllTahlil() {
    TahlilProvider().getAllDoaTahlil().then((value) {
      print(value.length);
      Future.delayed(
        Duration(milliseconds: 500),
        () {
          change(value, status: RxStatus.success());
        },
      );
    }, onError: (err) {
      change(null, status: RxStatus.error());
    });
  }
}
