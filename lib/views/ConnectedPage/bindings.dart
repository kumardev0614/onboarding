import 'package:get/get.dart';

import 'controller.dart';

class ConnectedBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectedpageController>(() => ConnectedpageController());
  }
}
