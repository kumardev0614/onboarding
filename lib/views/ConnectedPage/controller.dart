import 'package:get/get.dart';

class ConnectedpageController extends GetxController {
  ConnectedpageController();
  var callStatus = "Connecting...".obs;
  _initData() {
    update(["connectedpage"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
