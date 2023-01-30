import 'package:alquranapp/app/data/data_provider.dart';
import 'package:alquranapp/models/AsmaulHusna.dart';
import 'package:get/get.dart';

class AsmaulHusnaController extends GetxController
    with StateMixin<List<AsmaulHusna>> {
  //TODO: Implement AsmaulHusnaController

  @override
  void onInit() {
    super.onInit();
    findAllAsmaul();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void findAllAsmaul() {
    DataProvider().getAllAsmaulHusna().then((value) {
      Future.delayed(
        Duration(milliseconds: 500),
        () {
          List<AsmaulHusna> listAsmaul = [];
          for (var i in value) {
            listAsmaul.add(AsmaulHusna.fromJson(i));
          }
          change(listAsmaul, status: RxStatus.success());
        },
      );
    }, onError: (err) {
      change(null, status: RxStatus.error());
    });
  }
}
