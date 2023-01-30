import 'package:get/get.dart';

import '../controllers/doa_sholat_controller.dart';

class DoaSholatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoaSholatController>(
      () => DoaSholatController(),
    );
  }
}
