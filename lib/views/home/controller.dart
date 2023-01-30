import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../lib.dart';

class HomeController extends GetxController {
  HomeController();

  final state = HomeState();

  PersistentTabController tabCtr = PersistentTabController(initialIndex: 0);
  DateTime backButtonPressedAt = DateTime.now();
  void changeTabIndex(int index) {
    tabCtr.index = index;

    update();
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() async {
    super.onReady();
    connectToServer();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
