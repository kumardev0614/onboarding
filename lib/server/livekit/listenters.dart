import 'package:get/get.dart';
import 'package:livekit_client/livekit_client.dart';

import '../../lib.dart';

Future<void> listener() async {
  var roomListener = room.createListener();

  roomListener
    ..on<TrackSubscribedEvent>((_) async {
      connectedPagectr.callStatus.value = "Connected";
      Get.snackbar("trackSubscribed", "Call Connected");
    })
    ..on<ParticipantDisconnectedEvent>((_) async {
      // await Fluttertoast.showToast(
      //   msg: "Participant Disconnected",
      //   toastLength: Toast.LENGTH_SHORT,
      //   gravity: ToastGravity.TOP,
      //   timeInSecForIosWeb: 1,
      //   backgroundColor: Colors.black,
      //   textColor: Colors.white,
      //   fontSize: 16.0,
      // );
      Get.back();
      await disconnect();
      connectedPagectr.callStatus.value = "Connecting...";
    });
}
