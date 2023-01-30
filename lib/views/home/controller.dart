import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../lib.dart';

class HomeController extends GetxController {
  HomeController();

  final state = HomeState();

  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;

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
