import 'package:alquranapp/app/controllers/base_controller_controller.dart';
import 'package:alquranapp/app/data/alquran_api_provider.dart';
import 'package:alquranapp/models/Surah.dart';
import 'package:get/get.dart';

class DetailQuranController extends GetxController with StateMixin<dynamic> {
  //TODO: Implement DetailQuranController

  final ayat_index = 0.obs;

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
    Get.delete<BaseControllerController>();
  }

  void setAyatIndex(index) {
    ayat_index.value = index;
  }

  Future<void> getDetialSurah(String id) async {
    change(null, status: RxStatus.loading());
    AlquranApiProvider().getDetailSurah(id).then((result) {
      change(result, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error());
    });
  }
}
