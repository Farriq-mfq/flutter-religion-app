import 'package:get/get.dart';

import '../controllers/bacaan_controller.dart';

class BacaanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BacaanController>(
      () => BacaanController(),
    );
  }
}
