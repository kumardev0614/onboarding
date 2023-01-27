import 'package:get/get.dart';

class LivekitController extends GetxController {
  static LivekitController instance = Get.find();

  // var isCallConnected = false.obs;
  var callStatus = "Connecting...".obs;

  // changeCallStatus(bool isCallConnected) {
  //   if (isCallConnected) {
  //     callStatus.value = "Connected";
  //   }
  // }
}
