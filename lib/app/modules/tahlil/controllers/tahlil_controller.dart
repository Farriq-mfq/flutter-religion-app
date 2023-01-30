import 'package:alquranapp/app/data/data_provider.dart';
import 'package:alquranapp/models/TahlilModel.dart';
import 'package:get/get.dart';

class TahlilController extends GetxController
    with StateMixin<List<TahlilModel>> {
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
    DataProvider().getAllDoaTahlil().then((value) {
      Future.delayed(
        Duration(milliseconds: 500),
        () {
          List<TahlilModel> list_doa_tahlil = [];
          for (var i in value) {
            list_doa_tahlil.add(TahlilModel.fromJson(i));
          }
          print(list_doa_tahlil[0].title);
          change(list_doa_tahlil, status: RxStatus.success());
        },
      );
    }, onError: (err) {
      change(null, status: RxStatus.error());
    });
  }
}
