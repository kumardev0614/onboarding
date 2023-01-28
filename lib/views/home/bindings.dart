import 'package:get/get.dart';

import '../../lib.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ConnectedpageController>(() => ConnectedpageController());
  }
}
