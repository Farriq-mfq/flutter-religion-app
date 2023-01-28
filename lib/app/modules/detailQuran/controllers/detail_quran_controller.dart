import 'package:alquranapp/app/data/alquran_api_provider.dart';
import 'package:get/get.dart';

class DetailQuranController extends GetxController with StateMixin<Map<String,dynamic>> {
  //TODO: Implement DetailQuranController

  @override
  void onInit() {
    super.onInit();
    final param = Get.parameters;
    getDetialSurah(param['surahID'] as String);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getDetialSurah(String id) async {
    AlquranApiProvider().getDetailSurah(id).then((result) {
      print(result);
      change(result, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error());
    });
  }
}
