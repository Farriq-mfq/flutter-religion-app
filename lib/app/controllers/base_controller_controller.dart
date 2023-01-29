import 'package:get/get.dart';

class BaseControllerController extends GetxController {
  //TODO: Implement BaseControllerController

  final showPanel = false.obs;
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

  void setShowPanel() {
    showPanel.toggle();
  }
}
