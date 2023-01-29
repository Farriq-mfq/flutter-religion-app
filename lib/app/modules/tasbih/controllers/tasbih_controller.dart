
import 'package:get/get.dart';

class TasbihController extends GetxController {
  //TODO: Implement TasbihController

  final count = 1.obs;
  final tasbih_terulang = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() {
    if (count.value != 33) {
      count.value++;
    } else {
      count.value = 1;
      tasbih_terulang.value += 1;
    }
  }
}
