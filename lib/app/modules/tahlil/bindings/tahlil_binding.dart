import 'package:get/get.dart';

import '../controllers/tahlil_controller.dart';

class TahlilBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TahlilController>(
      () => TahlilController(),
    );
  }
}
